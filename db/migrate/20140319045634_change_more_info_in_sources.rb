class ChangeMoreInfoInSources < ActiveRecord::Migration
  def up
  	remove_column :sources, :more_info
  	add_column :sources, :depth, :integer, :default => 0
  end

  def down
  	add_column :sources, :more_info, :boolean, :default => false
  	remove_column :sources, :depth
  end
end
