class AccomplishmentsController < ApplicationController
	def create
		@accomplishment = Accomplishment.new(accomplishment_params)
		@saved = @accomplishment.save
	end

	private
		def accomplishment_params
			params.require(:accomplishment).permit(:value, :user_id, :competition_id)
		end
end
