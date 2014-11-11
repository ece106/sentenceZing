class ActivitiesController < ApplicationController
    include PublicActivity::StoreController
    
    def index
        @activities = PublicActivity::Activity.order('created_at desc').paginate(page: params[:page])
    end
    
    def notifications
        @activities = PublicActivity::Activity.order('created_at desc').paginate(page: params[:page])
    end
  
end