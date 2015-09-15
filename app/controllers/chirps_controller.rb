class ChirpsController < ApplicationController
	before_action :set_chirp, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	
	def index
		@chirps = Chirp.all
	end

	def new
		@chirp = Chirp.new
	end

	def edit
	end

	def show
	end

	def create
		@chirp = Chirp.create(chirp_params)
		redirect_to @chirp, notice: "Chirp! Chirp! Chirp!"
	end

	def update
		@chirp.update(chirp_params)
		redirect_to @chirp, notice: "Chirp updated! Chirp! Chirp!"
	end

	def destroy
		@chirp.destroy
		redirect_to chirps_path, notice: "Chirp was deleted. :("
	end

	private

	def chirp_params
		params.require(:chirp).permit(:body).merge(user: current_user)
	end

	def set_chirp
		begin
			@chirp = Chirp.find(params[:id])
		rescue
			flash[:notice] = "That chirp is not available."
			redirect_to chirps_path
		end
	end

end