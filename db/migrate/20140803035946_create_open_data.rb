class CreateOpenData < ActiveRecord::Migration
  def change
    create_table :open_data do |t|
    	t.references :municipality, index: true
    	t.references :indicator_source, index: true
    	t.integer :value
    	t.integer :deviation_value
    	t.text :memo
      t.timestamps
    end
  end
end
