class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :session_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :instructor
      t.string :email

      t.timestamps
    end

    add_index :participants, :session_id
  end
end
