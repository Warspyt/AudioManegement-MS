class SongsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

	# Get all songs
	def index
		@songs = Song.all

		# Devolver JSON
		render json: @songs
	end

	# Get song by id
	def show
		@song = Song.find(params[:id])

		# Devolver JSON
		render json: @song
	end

	# Post a new song
	def create
		@song = Song.new(song_params)

		# Devolver JSON
		if @song.save
			render json: { message: "Song uploaded successfully" }, status: :created
		else
			render json: { error: "The song was not uploaded", errors: @song.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for a song
	def update
		@song = Song.find(params[:id])

		# Devolver JSON
		if @song.update(song_params)
			render json: @song
		else
			render json: @song.errors, status: :unprocessable_entity
		end
	end

	# Delete a song
	def destroy
		@song = Song.find(params[:id])
		@song.destroy
	end

	# Read params
	private

	def song_params
		params.permit(:title, :publicationDate, :lyrics, :version, :userid, :audioid, :albumid)
	end
end
