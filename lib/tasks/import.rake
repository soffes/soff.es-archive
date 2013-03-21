require 'date'
require 'redcarpet'

desc 'Start over'
task :clean do
  redis.flushdb
  `rm -rf tmp`
end

desc 'Import from a fresh start'
task :import do
  unless File.exists?('tmp/repo')
    puts 'Cloning posts...'
    `git clone https://github.com/soffes/blog.git tmp/repo`
  else
    puts 'Updating posts...'
    'cd tmp/repo && git pull origin master'
  end

  # Posts
  Dir['tmp/repo/posts/*.markdown'].each do |path|
    matches = path.match(/\/(\d{4})-(\d{2})-(\d{2})-([\w\-]+)\.markdown$/)
    key = matches[4]
    next if redis.hexists('slugs', key)

    # Load content
    contents = File.open(path).read

    # Meta data
    meta = {
      key: key,
      title: key.capitalize,
      published_at: Date.new(matches[1].to_i, matches[2].to_i, matches[3].to_i).to_time.utc.to_i,
      type: 'post'
    }

    # Extract YAML front matter
    if result = contents.match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      contents = contents[(result[0].length)...(contents.length)]
      meta.merge!(YAML.safe_load(result[0]))
    end

    # Parse Markdown
    meta[:html] = markdown(contents)

    # Store in Redis
    redis.hset('slugs', key, MultiJson.dump(meta))
    redis.zadd('sorted-slugs', meta[:published_at], key)
    puts "Imported #{key}"
  end

  # Pages
  Dir['tmp/repo/pages/*'].each do |path|
    matches = path.match(/([\w\-]+)\.(markdown|html)$/)
    key = matches[1]
    next if redis.hexists('slugs', key)

    # Load content
    contents = File.open(path).read

    # Meta data
    meta = {
      key: key,
      title: key.capitalize,
      type: 'page'
    }

    # Extract YAML front matter
    if result = contents.match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      contents = contents[(result[0].length)...(contents.length)]
      meta.merge!(YAML.safe_load(result[0]))
    end

    # Parse Markdown
    meta[:html] = matches[2] == 'markdown' ? markdown(contents) : contents

    # Store in Redis
    redis.hset('slugs', key, MultiJson.dump(meta))
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
