# encoding: utf-8
class IndicatorSource < ActiveRecord::Base
	belongs_to :indicator
	has_many :open_data, dependent: :destroy

	default_scope { where(active: true) }
	
	def average
    open_data.inject(0.0) { |sum, i| sum += i.value } / open_data.size
  end

  def variance
    ave = average
    open_data.inject(0.0) { |sum, i| sum += (i.value - ave)**2 } / open_data.size
  end

  def standard_deviation
    Math::sqrt(variance)
  end

end
