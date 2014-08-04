class Category < ActiveRecord::Base
	has_many :indicators, dependent: :destroy

	default_scope	-> { order(:id) }

	validates :title, presence: true
end
