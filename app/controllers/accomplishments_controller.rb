class AccomplishmentsController < ApplicationController
	respond_to :html, :json

	def create
		@accomplishment = Accomplishment.new(accomplishment_params)
		@saved = @accomplishment.save
	end

	def update
		@accomplishment = Accomplishment.find(params[:id])
		@updated = @accomplishment.update_attributes(accomplishment_params)
		respond_with @accomplishment
	end

	private
		def accomplishment_params
			params.require(:accomplishment).permit(:value, :user_id, :competition_id)
		end
end
