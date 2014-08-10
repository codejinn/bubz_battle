class CompetitionsController < ApplicationController
	def join_battle
		@competition = Competition.find(params[:id])

		#save competition under current user
		@user = current_user
		@user.competition_id = @competition.id

		#create stake
		if !current_user.stakes.where(competition_id: @competition.id).any?
			Stake.create!(title: "Add your stake here!", user_id: current_user.id, competition_id: @competition.id)
		end

		#create accomplishments
		if !current_user.accomplishments.where(competition_id: @competition.id).any?
			(1..@competition.days).each do |i|
				Accomplishment.create!(value: 0, competition_id: @competition.id, user_id: current_user.id)
			end
		end

		if @user.save
			flash[:success] = "Joined competition."
			redirect_to competition_path(@competition)
		else
			flash[:notice] = "Couldn't join competition."
			redirect_to competitions_path
		end
	end

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
			#create accomplishments
			(1..@competition.days).each do |i|
				Accomplishment.create!(value: 0, competition_id: @competition.id, user_id: current_user.id)
			end

			#create stake
			Stake.create!(title: "Add your stake here!", user_id: current_user.id, competition_id: @competition.id)

			#save competition under current user
			@user = current_user
			@user.competition_id = @competition.id
			@user.save

			flash[:success] = "Competition created."
			redirect_to @competition
		else
			flash[:notice] = "Please fill out all fields correctly."
			render 'index'
		end
	end

	def show
		@competition = Competition.find(params[:id])
		@users = User.where(competition_id: @competition.id)
	end

	private
		def competition_params
			params.require(:competition).permit(:title, :days)
		end
end