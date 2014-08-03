class AddColumnSubTitleToIndicatorSources < ActiveRecord::Migration
  def change
    add_column :indicator_sources, :sub_title, :string
  end
end
