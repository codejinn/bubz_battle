class Accomplishment < ActiveRecord::Base
	#relationships
	belongs_to :competition
	belongs_to :user

	#validations
	validates_presence_of :competition_id, :user_id
	validates :value, presence: true,
										numericality: { only_integer: true, greater_than: 0 }
end
