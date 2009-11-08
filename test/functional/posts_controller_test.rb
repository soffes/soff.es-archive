require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Post.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Post.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Post.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to post_url(assigns(:post))
  end
  
  def test_edit
    get :edit, :id => Post.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Post.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Post.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Post.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Post.first
    assert_redirected_to post_url(assigns(:post))
  end
  
  def test_destroy
    post = Post.first
    delete :destroy, :id => post
    assert_redirected_to posts_url
    assert !Post.exists?(post.id)
  end
end
