class Municipality < ActiveRecord::Base
	has_many :open_data, dependent: :destroy

	scope :with_includes, -> { includes(:open_data => {:indicator_source => {:indicator => :category}}) }

	def calc_point(weights)
  	# "weights"=>{"1"=>{"2"=>"true"}, "2"=>{"3"=>"true"}, "3"=>{"3"=>"true"}, "4"=>{"2"=>"true"}, "5"=>{"2"=>"true"}, "6"=>{"3"=>"true"}}
		self.open_data.inject(0) do |sum, i|
			category_id = i.indicator_source.indicator.category.id
			if weights.detect{|w| w[:id] == category_id}.present?
				sum + i.deviation_value * weights.detect{|w| w[:id] == category_id}[:weight].to_i
			else
				sum + 0
			end
		end
	end

end
