require 'spec_helper'

describe UsersController do
  
  before(:each) do
    @user = mock_model(User)
  end
  
  
  describe "new" do
    
    before(:each) do
      User.stub!(:new).and_return(@user)
    end
    
    def get_new
      get :new
    end
    
    it "should instantiate new User" do
      User.should_receive(:new).and_return(@user)
      get_new
    end
    
    it "should render the new template" do
      get_new
      response.should render_template("users/new")
    end
    
    it "should assign ghe @user ivar" do
      get_new
      assigns[:user].should eql @user
    end
    
  end
  
  describe "create" do
    
    before(:each) do
      @user_form = {
        :email => "some email", :password => "some password", :password_confirmation => "some password"
      }
      User.stub!(:new).and_return(@user)
      @user.stub!(:save).and_return(true)
    end
    
    def post_create
      post :create, :user => @user_form
    end
    
    it "should instantiate new User" do
      User.should_receive(:new).and_return(@user)
      post_create
    end
    
    it "should assign the @user ivar" do
      post_create
      assigns[:user].should eql @user
    end
    
    it "should save the new user" do
      @user.should_receive(:save).and_return(true)
      post_create
    end
    
    it "should redirect to root url on success" do
      post_create
      response.should redirect_to products_path
    end
    
    it "should set success message" do
      post_create
      flash[:notice].should eq "Signed up!"
    end
    
    it "should render new template on save failure" do
      @user.stub!(:save).and_return(false)
      post_create
      response.should render_template("users/new")
    end
  end

end
