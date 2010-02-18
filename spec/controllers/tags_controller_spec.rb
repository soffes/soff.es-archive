require 'spec_helper'

describe TagsController do

  def mock_tag(stubs={})
    @mock_tag ||= mock_model(Tag, stubs).as_null_object
  end

    describe "GET index" do
    it "assigns all tags as @tags" do
      Tag.stub(:all).and_return([mock_tag])
      get :index
      assigns(:tags).should == [mock_tag]
    end
  end
  
  describe "GET show" do
    it "assigns the requested tag as @tag" do
      Tag.stub(:find).with("37").and_return(mock_tag)
      get :show, :id => "37"
      assigns(:tag).should equal(mock_tag)
    end
  end

  describe "GET new" do
    it "assigns a new tag as @tag" do
      Tag.stub(:new).and_return(mock_tag)
      get :new
      assigns(:tag).should equal(mock_tag)
    end
  end

  describe "GET edit" do
    it "assigns the requested tag as @tag" do
      Tag.stub(:find).with("37").and_return(mock_tag)
      get :edit, :id => "37"
      assigns(:tag).should equal(mock_tag)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tag as @tag" do
        Tag.stub(:new).with({'these' => 'params'}).and_return(mock_tag(:save => true))
        post :create, :tag => {'these' => 'params'}
        assigns(:tag).should equal(mock_tag)
      end

      it "redirects to the created tag" do
        Tag.stub(:new).and_return(mock_tag(:save => true))
        post :create, :tag => {}
        response.should redirect_to(tag_url(mock_tag))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tag as @tag" do
        Tag.stub(:new).with({'these' => 'params'}).and_return(mock_tag(:save => false))
        post :create, :tag => {'these' => 'params'}
        assigns(:tag).should equal(mock_tag)
      end

      it "re-renders the 'new' template" do
        Tag.stub(:new).and_return(mock_tag(:save => false))
        post :create, :tag => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tag" do
        Tag.should_receive(:find).with("37").and_return(mock_tag)
        mock_tag.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tag => {'these' => 'params'}
      end

      it "assigns the requested tag as @tag" do
        Tag.stub(:find).and_return(mock_tag(:update_attributes => true))
        put :update, :id => "1"
        assigns(:tag).should equal(mock_tag)
      end

      it "redirects to the tag" do
        Tag.stub(:find).and_return(mock_tag(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tag_url(mock_tag))
      end
    end

    describe "with invalid params" do
      it "assigns the tag as @tag" do
        Tag.stub(:find).and_return(mock_tag(:update_attributes => false))
        put :update, :id => "1"
        assigns(:tag).should equal(mock_tag)
      end

      it "re-renders the 'edit' template" do
        Tag.stub(:find).and_return(mock_tag(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tag" do
      Tag.should_receive(:find).with("37").and_return(mock_tag)
      mock_tag.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tags list" do
      Tag.stub(:find).and_return(mock_tag(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tags_url)
    end
  end

end
