class ChangeColumnFloatInOpenData < ActiveRecord::Migration
  def change
  	change_column :open_data, :deviation_value, :float
  end
end
