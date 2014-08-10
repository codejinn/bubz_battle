class Stake < ActiveRecord::Base
	#relationships
	belongs_to :user
	belongs_to :competition
end
