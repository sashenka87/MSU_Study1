class ChangeFieldsForSources < ActiveRecord::Migration
  def change
    add_column :sources, :pre_reason, :integer
    add_column :sources, :pre_reason_other_text, :string
    add_column :sources, :like_text, :integer
    add_column :sources, :sentiment, :integer
    add_column :sources, :post_reason, :integer
    add_column :sources, :post_reason_other_text, :string
  end
end
