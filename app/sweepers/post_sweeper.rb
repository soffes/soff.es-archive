class PostSweeper < ActionController::Caching::Sweeper
  # observe Post
  # 
  # def sweep(post)
  #   expire_action root_url
  #   expire_action posts_url(format: 'atom')
  #   expire_action post_url(post)
  #   
  #   # This sucks, but whatevs
  #   (Post.count / Post.per_page).times do |i|
  #     expire_action blog_page_url(i + 1)
  #   end
  # end
  # 
  # alias_method :after_create, :sweep
  # alias_method :after_update, :sweep
  # alias_method :after_destroy, :sweep
end
