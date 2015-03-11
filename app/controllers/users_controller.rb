class UsersController < ApplicationController
    before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
    before_action :correct_user,   only: [:edit, :update]

    # GET /users
    # GET /users.json
    def index
        @users = User.all
        @stories = Story.all
    end
  
    def usersearch
        @users = User.all
    end

    def extraprofilepage
        @user = User.find(params[:id])
    end

    # GET /users/1
    # GET /users/1.json
    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
        @stories = Story.all
        @activities = PublicActivity::Activity.order('created_at desc').paginate(page: params[:page])
    end

    # GET /users/new
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
        @user = User.find(params[:id])
    end

    # POST /users
    # POST /users.json
    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            @user.update_attribute(:loggedin, 1)
            flash[:success] = "Welcome to SentenceZing!"
            redirect_to @user
        else
            render 'new'
        end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            render 'edit'
        end
    end 

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url }
            format.json { head :no_content }
        end
    end
  
    def following
        @title = "Following"
        @user = User.find(params[:id])
        @users = @user.followed_users.paginate(page: params[:page])
        render 'show_follow'
    end

    def followers
        @title = "Followers"
        @user = User.find(params[:id])
        @users = @user.followers.paginate(page: params[:page])
        render 'show_follow'
    end

    private
      
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:name, :permalink, :loggedin, :email, :password, :password_confirmation, :terms_of_service,:aboutme, :micropost, :story, :image, :banner)
    end
    
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    
end