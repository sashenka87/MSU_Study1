class AddSourceIdToSources < ActiveRecord::Migration
  def change
  	add_column :sources, :source_name, :string
  end
end
