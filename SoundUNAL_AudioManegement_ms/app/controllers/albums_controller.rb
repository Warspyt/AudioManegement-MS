class AlbumsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # Get all albums
	def index
		@albums = Album.all.map do |album|
			image_url = url_for(album.image) if album.image.attached?
			album.as_json.merge(image_url: image_url)
		end

		# Devolver JSON
		render json: @albums
	end

  # Get album by id
	def show
		image_url = url_for(album.image) if album.image.attached?

		# Devolver JSON
		render json:

		album.as_json.merge(image_url: image_url)
	end

	# Post a new album
	def create
		@album = Album.new(album_params)

		# Devolver JSON
		if @album.save
			render json: { message: "Album uploaded successfully" }, status: :created
		else
			render json: { error: "The album was not uploaded", errors: @album.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for an album
	def update
		# Devolver JSON
		if album.update(album_params)
			render json: @album
		else
			render json: @album.errors, status: :unprocessable_entity
		end
	end

	# Delete a album
	def destroy
		album.destroy
	end

	# Read params
	private

	def album_params
		params.permit(:name, :description, :userid, :image)
	end

	def album
		@album = Album.find(params[:id])
	end
end
