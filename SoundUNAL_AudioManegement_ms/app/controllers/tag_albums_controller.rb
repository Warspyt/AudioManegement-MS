class TagAlbumsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # Obtener todas las tags con sus respectivos albums
	def index
		@tag_albums = TagAlbum.all.group_by(&:tagid)

		# Devolver JSON
		render json: @tag_albums
	end

  # Obtener todos los albums de una determinada tag => por genero
  def show
		# Devolver JSON
		render json: TagAlbum.where(tagid: params[:id])
	end

	# Post a new tag album
	def create
		@tag_album = TagAlbum.new(tag_album_params)

		# Devolver JSON
		if @tag_album.save
			render json: { message: "Tag album uploaded successfully" }, status: :created
		else
			render json: { error: "The tag album was not uploaded", errors: @tag_album.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for a tag album
	def update
		# Devolver JSON
		if tag_album.update(tag_album_params)
			render json: @tag_album
		else
			render json: @tag_album.errors, status: :unprocessable_entity
		end
	end

	# Delete a tag album
	def destroy
		tag_album.destroy
	end

	# Read params
	private

	def tag_album_params
		params.permit(:tagid, :albumid)
	end

	def tag_album
		@tag_album = TagAlbum.find(params[:id])
	end
end
