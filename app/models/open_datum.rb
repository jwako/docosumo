# encoding: utf-8
class OpenDatum < ActiveRecord::Base
	belongs_to :municipality
	belongs_to :indicator_source

	default_scope	-> { order(:id) }

	validates :value, presence: true

	def deviation
		# 偏差値＝(得点－平均点)÷標準偏差×10＋50
		(value - indicator_source.average)/indicator_source.standard_deviation * 10 + 50
	end

end
