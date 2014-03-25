class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.integer :stance_id
      t.text :body

      t.timestamps
    end

    add_index :evidences, :stance_id
  end
end
