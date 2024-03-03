module Api
    module V1
      class UsersController < ApplicationController
        before_action :set_user, only: %i[ show ]
  
        # GET /api/v1/users or /api/v1/users.json
        def index
          @users = User.all
        end
  
        # GET /api/v1/users/1 or /api/v1/users/1.json
        def show
          respond_to do |format|
            format.html { redirect_to user_url(@user), notice: "Redirected from API because it returns JSON objects, but HTML has been requested." }
            format.json
          end
        end
  
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_user
            @user = User.find(params[:id])
          end
      end
    end
  end   