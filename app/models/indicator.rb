class Indicator < ActiveRecord::Base
	belongs_to :category
	has_many :indicator_sources, dependent: :destroy

	default_scope	-> { order(:id) }

	validates :title, presence: true

end
