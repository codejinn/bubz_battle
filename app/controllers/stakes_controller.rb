class StakesController < ApplicationController
	def create
		@stake = Stake.new(stake_params)
		@saved = @stake.save
	end

	def update
		@stake = Stake.find(params[:id])
		@updated = @stake.update_attributes(stake_params)

		respond_to do |format|
			format.js
		end
	end

	private
		def stake_params
			params.require(:stake).permit(:title, :competition_id, :user_id)
		end
end
