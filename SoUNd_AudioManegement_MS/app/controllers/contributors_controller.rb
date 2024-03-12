class ContributorsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # Obtener todas las playlist con sus respectivos contribuidores
	def index
		@contributors = Contributor.all.group_by(&:playlistid)

		# Devolver JSON
		render json: @contributors
	end

  # Obtener todas las playlist agrupadas por contribuidor
	def playlists_by_user
		@contributors = Contributor.all.group_by(&:userid)

		# Devolver JSON
		render json: @contributors
	end

  # Obtener todos los contribuidores de una determinada playlist
  def show
		# Devolver JSON
		render json: Contributor.where(playlistid: params[:id])
	end

  # Obtener todas las playlist de un determinado contribuidor
  def playlist_by_user
		# Devolver JSON
		render json: Contributor.where(userid: params[:id])
	end

	# Post a new contributor playlist
	def create
		@contributor = Contributor.new(contributor_params)

		# Devolver JSON
		if @contributor.save
			render json: { message: "contributor uploaded successfully" }, status: :created
		else
			render json: { error: "The contributor was not uploaded", errors: @contributor.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for a contributor
	def update
		# Devolver JSON
		if contributor.update(contributor_params)
			render json: @contributor
		else
			render json: @contributor.errors, status: :unprocessable_entity
		end
	end

	# Delete a contributor
	def destroy
		contributor.destroy
	end

	# Read params
	private

	def contributor_params
		params.permit(:playlistid, :userid)
	end

	def contributor
		@contributor = Contributor.find(params[:id])
	end
end
