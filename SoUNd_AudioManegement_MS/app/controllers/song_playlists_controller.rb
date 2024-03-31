class SongPlaylistsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # Obtener todas las playlist con sus respectivas canciones
	def index
		@song_playlists = SongPlaylist.all.group_by(&:playlistid)

		# Devolver JSON
		render json: @song_playlists
	end

  # Obtener todas las canciones de una determinada playlist
  def show
		# Devolver JSON
		render json: SongPlaylist.where(playlistid: params[:id])
	end

	# Post a new song playlist
	def create
		@song_playlist = SongPlaylist.new(song_playlist_params)

		# Devolver JSON
		if @song_playlist.save
			render json: { message: "Playlist song uploaded successfully" }, status: :created
		else
			render json: { error: "The playlist song was not uploaded", errors: @song_playlist.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for a song playlist
	def update
		# Devolver JSON
		if song_playlist.update(song_playlist_params)
			render json: @song_playlist
		else
			render json: @song_playlist.errors, status: :unprocessable_entity
		end
	end

	# Delete a song playlist
	def destroy
		song_playlist.destroy
	end

	# Read params
	private

	def song_playlist_params
		params.permit(:playlistid, :songid)
	end

	def song_playlist
		@song_playlist = SongPlaylist.find(params[:id])
	end
end
