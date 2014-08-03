class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
    	t.references :category, index: true
    	t.string :code
    	t.string :title
      t.timestamps
    end
  end
end
