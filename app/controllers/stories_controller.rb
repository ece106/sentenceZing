class StoriesController < ApplicationController
    before_action :set_story, only: [:show, :edit, :update, :destroy]
    before_filter :update_story, :only => [:edit, :refreshstory]
    layout :resolve_layout

    # GET /stories
    # GET /stories.json
    def index
        @stories = Story.find(:all, :order => "created_at DESC") # deprecated
        # @feed_items = @story.microposts.paginate(page: params[:page])
    end
  
    def voting
        @stories = Story.all
        # @like = Like.find(params[:id])
        # @like = Like.find(params[:story_id,:user_id])
    end

    # GET /stories/1
    # GET /stories/1.json
    def show
        @story = Story.find(params[:id])
        @micropost  = @story.microposts.build
        @feed_items = @story.microposts.paginate(page: params[:page])
    end

    # GET /stories/new
    def new
        @story = Story.new
        if signed_in?
            @feed_items = current_user.feed.paginate(page: params[:page])
        end
    end

    def postbox
        @story = Story.find(params[:id])
        @micropost  = @story.microposts.build
        @feed_items = @story.microposts.paginate(page: params[:page])
    end

    # GET /stories/1/edit
    def edit
        @story = Story.find(params[:id])
        # @micropost = current_user.microposts.build if signed_in?
        @micropost  = @story.microposts.build
        @feed_items = @story.microposts.paginate(page: params[:page])
        respond_to do |format|
            format.json { }  #shared/micropost_form
            format.html { }
        end  
    end

    # POST /stories
    # POST /stories.json
    def create
        # @story = Story.new(story_params)
        @story = current_user.stories.build(story_params)

        respond_to do |format|
            if @story.save
                @story.create_activity :create, owner: current_user
                format.html { redirect_to edit_story_path(@story.id), notice: 'Story was successfully created.' }
                format.json { render action: 'edit', status: :created, location: @story }
                # redirect_to ???
            else
                format.html { render action: 'new' }
                format.json { render json: @story.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /stories/1
    # PATCH/PUT /stories/1.json
    def update
        respond_to do |format|
            if @story.update(story_params)
                @story.create_activity :update, owner: current_user
                format.html { } # render action: 'edit', notice: 'Story was successfully joined' }
                format.json { head :no_content }
                @stories = Story.all
                # @story.user2id= params[:user2id]
                # Is joining a story the only Update? Can we edit title, category?
                redirect_to edit_story_path(@story.id)
            else
                format.html { render action: 'index' }
                format.json { render json: @story.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /stories/1 
    # DELETE /stories/1.json
    def destroy
        @story.destroy
        respond_to do |format|
            format.html { redirect_to stories_url }
            format.json { head :no_content }
        end
    end
  
    def refreshstory
        render edit.html.erb, :locals => { :micropost_streams => @micropost_streams }
    end

    protected
    
    def update_story
        @micropost_streams = Micropost.order('created_at ASC').all
    end 

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_story
        @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
        params.require(:story).permit(:title, :category, :micropost, :user_id, :user2id, :turn)
    end

    def resolve_layout
        case action_name
            when 'show'
            'emptyshow'
            when 'postbox'
            'emptyshow'
        else
            'application'
        end
    end

end
