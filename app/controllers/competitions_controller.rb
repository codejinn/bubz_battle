class CompetitionsController < ApplicationController
	def index
		@competitions = Competition.recently
		@competition = Competition.new
	end

	def new
		@competition = Competition.new
	end

	def create
		@competition = Competition.new(competition_params)

		if @competition.save
			flash[:success] = "Competition created."
			redirect_to @competition

			#save competition under current user
			@user = current_user
			@user.competition_id = @competition.id
			@user.save!
		else
			flash[:notice] = "Please fill out all fields correctly."
			render 'index'
		end
	end

	def show
		@competition = Competition.find(params[:id])
	end

	private
		def competition_params
			params.require(:competition).permit(:title, :days)
		end
end