class AccomplishmentsController < ApplicationController
	def load_update_form
		#load update form for accomplishment on competition show page
		@accomplishment = Accomplishment.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def create
		@accomplishment = Accomplishment.new(accomplishment_params)
		@saved = @accomplishment.save
	end

	def update
		@accomplishment = Accomplishment.find(params[:id])
		@updated = @accomplishment.update_attributes(accomplishment_params)

		respond_to do |format|
			format.js
		end
	end

	private
		def accomplishment_params
			params.require(:accomplishment).permit(:value, :user_id, :competition_id)
		end
end
