class AddEventStartToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_start, :datetime
  end
end
