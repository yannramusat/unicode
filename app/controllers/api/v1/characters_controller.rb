module Api
  module V1
    class CharactersController < ApplicationController
      before_action :set_character, only: %i[ show ]

      # GET /api/v1/characters or /api/v1/characters.json
      def index
        @characters = Character.all
      end

      # GET /api/v1/characters/1 or /api/v1/characters/1.json
      def show
        @decomp = []
        if !@character.decomposition.nil?
          decomp_str = @character.decomposition.split
          decomp_str.map do |str|
            @decomp << api_v1_character_url(Character.find(str))
          end
        end
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
    end
  end
end      
