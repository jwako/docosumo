class Municipality < ActiveRecord::Base
	has_many :open_data, dependent: :destroy

end
