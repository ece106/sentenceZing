class MicropostsController < ApplicationController
    before_action :signed_in_user, only: [:create, :destroy]

    def index
        @microposts = Micropost.where("story_id = ? ", params[:story_id] )
        # @micropost = Micropost.find(params[:id])
        @story = Story.find( params[:story_id] )  
        @turn = params[:turn]
    end

    def show
        @micropost = Micropost.find(params[:id])
    end

    def create
        @micropost = current_user.microposts.build(micropost_params)
        @story = Story.find(@micropost.story_id)

        if @micropost.save
          
            if @story.user2id == 0 && current_user.id != @story.user_id
                @story.user2id = current_user.id
            end  
            
            @story.turn = current_user.id
            @micropost.create_activity :create, owner: current_user
            flash[:success] = "Micropost created!"
            redirect_to :back, anchor: '#bottom'
 
            respond_to do |format|
                # format.html { redirect_to :back }
                format.html { }
                format.json { }
                # format.json { head :no_content }
                # format.json { render action: 'edit', status: :created, location: @story }
            end
            @story.save
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end

    def destroy
    end
  
    private

    def micropost_params
        params.require(:micropost).permit(:content, :story_id, :user_id)
    end
  
end