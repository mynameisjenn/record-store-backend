module Api
  module V1

    class ArtistsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_artist, only: [:show, :update, :destroy]

      # GET /artists
      # GET /artists.json
      def index
        @artists = Artist.all
      end

      # GET /artists/1
      # GET /artists/1.json
      def show
      end

      # POST /artists
      # POST /artists.json
      def create
        @artist = Artist.new(artist_params)

        if @artist.save
          render :show, status: :created 
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /artists/1
      # PATCH/PUT /artists/1.json
      def update
        if @artist.update(artist_params)
          render :show, status: :ok, location: @artist
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end

      # DELETE /artists/1
      # DELETE /artists/1.json
      def destroy
        @artist.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_artist
          @artist = Artist.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def artist_params
          params.require(:artist).permit(:name)
        end
    end
  end
end