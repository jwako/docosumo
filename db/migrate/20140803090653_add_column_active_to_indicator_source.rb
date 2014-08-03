class AddColumnActiveToIndicatorSource < ActiveRecord::Migration
  def change
  	add_column :indicator_sources, :active, :boolean, :default => true, :null => false
  end
end
