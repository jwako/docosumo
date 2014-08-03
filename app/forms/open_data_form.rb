require 'csv'
require 'kconv'

class OpenDataForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persisted?
    false
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "OpenDataForm")
  end

  attr_reader :data
  attr_accessor :file

  validates :file, presence: true

  def initialize(args=nil)
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end if args.present?
  end

  def save_all!
    return false if @file.blank?
    @data = load_csv(@file.read)
    ActiveRecord::Base.transaction do
      @data.each do |datum|
        datum.save!
      end
    end
  end

  private

  def load_csv(charactor)
    data, n, is = [], 0, nil
    CSV.parse(Kconv.toutf8(charactor)) do |row|
    	n = n+1
    	next if n == 1 or row.join.blank?
			is = IndicatorSource.find_by(id: row[1].to_i) if n == 2
      if n >= 3 && is.present? && row[0].present? 
      	m = Municipality.find_by(name: row[0])
      	puts row[0]
        if m.present? && row[1].present?
        	datum = is.open_data.new(municipality: m, value: row[1].to_i)
          data << datum
        end
      end
    end
    data
  end

end