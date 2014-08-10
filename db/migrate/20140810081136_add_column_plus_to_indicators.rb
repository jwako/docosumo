class AddColumnPlusToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :plus, :boolean, default: true, null: false
  end
end
