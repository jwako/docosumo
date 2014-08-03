class IndicatorSource < ActiveRecord::Base
	belongs_to :indicator
	has_many :open_data, dependent: :destroy

end
