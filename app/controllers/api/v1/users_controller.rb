module Api
    module V1
      class UsersController < ApplicationController
        before_action :set_user, only: %i[ show update destroy]
  
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

        # POST /api/v1/users or /api/v1/users.json
        def create
          respond_to do |format|
            @user = User.new(user_params)
            if @user.save
              format.json { render :show, status: :created, location: @user }
            else
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
        end

        # PATCH/PUT /api/v1/users/1 or /api/v1/users/1.json
        def update
          respond_to do |format|
            if @user.update(user_params)
              format.json { render :show, status: :ok, location: @user }
            else
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
        end

        # DELETE /api/v1/users/1 or /api/v1/users/1.json
        def destroy
          @user.destroy!

          respond_to do |format|
            format.json { head :no_content }
          end
        end
  
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_user
            @user = User.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def user_params
            params.require(:user).permit(:username, :mail)
          end
      end
    end
  end   