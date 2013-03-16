namespace :export do
  desc 'Export posts in Jekyll format'
  task :jekyll => :environment do
    `mkdir -p #{Rails.root}/posts`

    Post.all.each do |post|
      filename = "#{post.published_at.strftime('%Y-%m-%d')}-#{post.permalink}.markdown"
      File.open "#{Rails.root}/posts/#{filename}", 'w' do |file|
        quote = post.title.include?(':') ? '"' : ''
        tags = post.tags.length > 0 ? "\ntags: [#{post.tags.collect { |tag| tag.name }.sort.join(', ')}]" : ''
        contents = "---\ntitle: #{quote}#{post.title}#{quote}#{tags}\n---\n\n#{post.content}"
        contents = "#{contents.chomp}\n"
        file.write contents
      end
    end
  end
end
