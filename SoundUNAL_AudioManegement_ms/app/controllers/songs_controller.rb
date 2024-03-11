class SongsController < ApplicationController
	def index
		@songs = Song.all
		# Devolver JSON
		render json: @songs
	end

	def show
		@song = Song.find(params[:id])
		# Devolver JSON
		render json: @song
	end
end
