class TagSongsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # Obtener todas las tags con sus respectivas canciones
	def index
		@tag_songs = TagSong.all.group_by(&:tagid)

		# Devolver JSON
		render json: @tag_songs
	end

  # Obtener todas las canciones de una determinada tag => por genero
  def show
		# Devolver JSON
		render json: TagSong.where(tagid: params[:id])
	end

	# Post a new tag song
	def create
		@tag_song = TagSong.new(tag_song_params)

		# Devolver JSON
		if @tag_song.save
			render json: { message: "Tag song uploaded successfully" }, status: :created
		else
			render json: { error: "The tag song was not uploaded", errors: @tag_song.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for a tag song
	def update
		# Devolver JSON
		if tag_song.update(tag_song_params)
			render json: @tag_song
		else
			render json: @tag_song.errors, status: :unprocessable_entity
		end
	end

	# Delete a tag song
	def destroy
		tag_song.destroy
	end

	# Read params
	private

	def tag_song_params
		params.permit(:tagid, :songid)
	end

	def tag_song
		@tag_song = TagSong.find(params[:id])
	end
end
