class OpenData < ActiveRecord::Base
	belongs_to :municipality
	belongs_to :indicator_source
	
end
