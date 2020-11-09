class RemoveTagIdFromEvent < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :tag_id, :integer
  end
end
