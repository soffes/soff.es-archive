class PostSweeper < ActionController::Caching::Sweeper
  observe Post
  
  def after_save(post)
    expire_cache(post)
  end
  
  def after_destory(post)
    expire_cache(post)
  end
  
  def expire_cache(post)
    expire_page :controller => 'posts', :action => 'page'
    expire_page :controller => 'posts', :action => 'show', :id => post.id
  end
end
  