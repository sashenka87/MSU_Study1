class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :stance_id
      t.string  :source_name
      t.integer :category
      t.integer :useful_ranking
      t.string :useful_justification
      t.integer :trustworthy_ranking
      t.string :trustworthy_justification
      t.integer :accurate_ranking
      t.string :accurate_justification
      t.integer :interesting_ranking
      t.string :interesting_justification

      t.timestamps
    end

    add_index :rankings, :stance_id
  end
end
