class CreateStances < ActiveRecord::Migration
  def change
    create_table :stances do |t|
      t.integer :participant_id
      t.integer :supporting
      t.integer :time_duration

      t.timestamps
    end

    add_index :stances, :participant_id
  end
end
