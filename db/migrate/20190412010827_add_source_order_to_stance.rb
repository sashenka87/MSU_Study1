class AddSourceOrderToStance < ActiveRecord::Migration
  def change
    add_column :stances, :source_order, :string
  end
end
