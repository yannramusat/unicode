module Api
  module V1
    class UserCharactersController < ApplicationController
      before_action :set_character, only: %i[ show ]
      before_action :get_user

      # GET /api/v1/users/:user_id/characters or /api/v1/users/:user_id/characters.json
      def index
        @characters = @user.characters.all
        render "api/v1/characters/index"
      end

      # GET /api/v1/characters/1 or /api/v1/characters/1.json
      def show
        respond_to do |format|
          format.html { redirect_to character_url(@character), notice: "Redirected from API because it returns JSON objects, but HTML has been requested." }
          format.json
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