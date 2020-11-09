class AddTagIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :tag_id, :integer
  end
end
