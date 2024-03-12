class PlaylistsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # Get all playlists
	def index
		@playlists = Playlist.all

		# Devolver JSON
		render json: @playlists
	end

  # Get playlist by id
  def show
		# Devolver JSON
		render json: playlist
	end

	# Post a new playlist
	def create
		@playlist = Playlist.new(playlist_params)

		# Devolver JSON
		if @playlist.save
			render json: { message: "Playlist uploaded successfully" }, status: :created
		else
			render json: { error: "The playlist was not uploaded", errors: @playlist.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for an playlist
	def update
		# Devolver JSON
		if playlist.update(playlist_params)
			render json: @playlist
		else
			render json: @playlist.errors, status: :unprocessable_entity
		end
	end

	# Delete a playlist
	def destroy
		playlist.destroy
	end

	# Read params
	private

	def playlist_params
		params.permit(:name, :userid)
	end

	def playlist
		@playlist = Playlist.find(params[:id])
	end
end
