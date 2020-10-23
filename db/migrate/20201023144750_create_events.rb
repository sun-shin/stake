class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :user_id
      t.text :description
      t.string :address
      t.integer :attendee_limit
      t.date :date

      t.timestamps
    end
  end
end
