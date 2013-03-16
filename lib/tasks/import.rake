require 'date'
require 'redcarpet'

desc 'Import from a fresh start'
task :import do
  unless File.exists?('tmp/repo')
    puts 'Cloning posts...'
    `git clone https://github.com/soffes/blog.git tmp/repo`
  else
    puts 'Updating posts...'
    'cd tmp/repo && git pull origin master'
  end

  Dir['tmp/repo/posts/*.markdown'].each do |path|
    matches = path.match(/\/(\d{4})-(\d{2})-(\d{2})-([\w\-]+)\.markdown$/)
    key = matches[4]
    next if redis.sismember('slugs', key)

    # Load content
    contents = File.open(path).read

    # Extract meta data
    meta = if result = contents.match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      contents = contents[(result[0].length)...(contents.length)]
      YAML.safe_load(result[0])
    end

    # Parse date
    published_at = Date.new(matches[1].to_i, matches[2].to_i, matches[3].to_i).to_time.utc.to_i

    # Store in Redis
    redis.sadd('slugs', key)
    redis.hset("slug-#{key}", 'key', key)
    redis.hset("slug-#{key}", 'published_at', published_at)
    redis.hset("slug-#{key}", 'html', markdown(contents))
    if meta
      redis.hset("slug-#{key}", 'title', meta['title'])
      redis.hset("slug-#{key}", 'tags', meta['tags'].to_yaml)
    end    
    redis.zadd('sorted-slugs', published_at, key)
    puts "Imported #{key}"
  end

  puts 'Done!'
end

def redis
  Soffes.redis
end

def markdown(text)
  return '' unless text and text.length > 0

  options = {
    no_intra_emphasis: true,
    tables: true,
    fenced_code_blocks: true,
    autolink: true,
    strikethrough: true,
    space_after_headers: true,
    superscript: true
  }
  markdown = Redcarpet::Markdown.new(Soffes::MarkdownRenderer, options)
  markdown.render(text)
end
