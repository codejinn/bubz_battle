class Competition < ActiveRecord::Base
	#relationships
	has_many :users
	has_many :stakes
	has_many :accomplishments

	#validations
	validates :title, presence: true
	validates :days, presence: true, 
									 numericality: { only_integer: true, greater_than: 0 }
	#scopes
	scope :recently, -> {order("created_at DESC")}
end
