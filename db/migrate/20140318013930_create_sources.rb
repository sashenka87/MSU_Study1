class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.integer :stance_id
      t.integer :order
      t.integer :time_duration
      t.boolean :more_info, :default => false
      t.integer :trustworthy
      t.integer :useful
      t.integer :accurate
      t.integer :interesting

      t.timestamps
    end

    add_index :sources, :stance_id
  end
end
