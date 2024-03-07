module Api
  module V1
    class UserCharactersController < ApplicationController
      before_action :set_character, only: %i[ update destroy]
      before_action :get_user

      # GET /api/v1/users/:user_id/characters or /api/v1/users/:user_id/characters.json
      def index
        @characters = @user.characters.all
        render "api/v1/characters/index"
      end

      # PATCH/PUT /api/v1/users/:user_id/characters/1 or /api/v1/users/:user_id/characters/1.json
      def update
        respond_to do |format|
          @user.characters << @character
          format.json { render "api/v1/characters/show", status: :ok, location: @user }
        rescue  ActiveRecord::RecordNotUnique => e #if already set to favorite by this user
          format.json { render json: e, status: :unprocessable_entity, location: @user }
        end
      end

      # DELETE /api/v1/users/:user_id/characters/1 or /api/v1/users/:user_id/characters/1.json
      def destroy
        @user.characters.destroy(@character)

        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_character
          @character = Character.find(params[:id])
        end

        def get_user
          unless params[:user_id].nil?
            @user = User.find(params[:user_id])
          end
        end
    end
  end
end 