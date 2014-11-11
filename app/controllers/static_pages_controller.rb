class StaticPagesController < ApplicationController
    layout :resolve_layout


    def home
        if signed_in?
            @micropost  = current_user.microposts.build
            @feed_items = current_user.feed.paginate(page: params[:page])
        end
    end

    def about
    end

    def contactus
    end

    def show
    end

    def termsofservice
    end

    def resolve_layout
        case action_name
            when 'termsofservice'
            'emptyshow'
        else
            'application'
        end
    end
    
end
