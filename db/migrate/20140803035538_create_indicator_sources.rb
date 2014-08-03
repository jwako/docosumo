class CreateIndicatorSources < ActiveRecord::Migration
  def change
    create_table :indicator_sources do |t|
    	t.references :indicator, index: true
    	t.string :title
    	t.integer :year
    	t.integer :month
    	t.string :url
    	t.string :authority
      t.timestamps
    end
  end
end
