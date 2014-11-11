class SessionsController < ApplicationController
    #  before_action :set_session, only: [:show, :edit, :update, :destroy]

    # GET /sessions/new
    def new
    end

    # POST /sessions
    # POST /sessions.json
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in user
            user.update_attribute(:loggedin, 1)
            redirect_back_or user
        else
           flash.now[:error] = 'Invalid email/password combination'
           render 'new'
        end
    end

    # PATCH/PUT /sessions/1
    # PATCH/PUT /sessions/1.json
    # def update
        # respond_to do |format|
            # if @session.update(session_params)
                # format.html { redirect_to @session, notice: 'Session was successfully updated.' }
                # format.json { head :no_content }
            # else
                # format.html { render action: 'edit' }
                # format.json { render json: @session.errors, status: :unprocessable_entity }
            # end
        # end
    # end

    # DELETE /sessions/1
    # DELETE /sessions/1.json
    def destroy
        current_user.update_attribute(:loggedin, 0)
        sign_out
        redirect_to root_url
    end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    # def set_session
        # @session = Session.find(params[:id])
    # end

    # def session_params
        # params.require(:session).permit(:new, :create, :destroy)
    # end
    
end
