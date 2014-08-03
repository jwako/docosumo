class Indicator < ActiveRecord::Base
	belongs_to :category
	has_many :indicator_sources, dependent: :destroy

end
