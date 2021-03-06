# encoding: utf-8
class OpenDatum < ActiveRecord::Base
	belongs_to :municipality
	belongs_to :indicator_source

	default_scope	-> { order(:id) }

	validates :value, presence: true

	def deviation
		if indicator_source.indicator.plus
			return calc_deviation(1)
		else
			return calc_deviation(-1)
		end
	end

	def as_json(options = {})
		{
			id: id,
			municipality: municipality.name,
			category_title: indicator_source.indicator.category.title,
			indicator_title: indicator_source.indicator.title,
			indicator_source_title: indicator_source.title,
			indicator_source_subtitle: indicator_source.sub_title,
			indicator_source_year: indicator_source.year,
			indicator_source_url: indicator_source.url,
			value: value,
			deviation_value: deviation_value
		}
	end

	private

	# 偏差値＝(得点－平均点)÷標準偏差×10＋50
	def calc_deviation(plus)
		(value - indicator_source.average)/indicator_source.standard_deviation * 10 * plus + 50
	end

end
