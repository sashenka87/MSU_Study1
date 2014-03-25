class RemoveEvidenceModel < ActiveRecord::Migration
	def up
		remove_index :evidences, :stance_id
		drop_table :evidences

		add_column :stances, :statement, :text
		remove_column :stances, :time_duration
	end

  def down
  	remove_column :stances, :statement
  	add_column :stances, :time_duration, :integer

    create_table :evidences do |t|
      t.integer :stance_id
      t.text :body

      t.timestamps
    end

    add_index :evidences, :stance_id
  end
end
