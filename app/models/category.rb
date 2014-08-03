class Category < ActiveRecord::Base
	has_many :indicators, dependent: :destroy
	
end
