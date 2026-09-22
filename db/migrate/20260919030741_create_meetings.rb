class CreateMeetings < ActiveRecord::Migration[8.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.text :description
      t.date :held_on
      t.string :location
      t.integer :capacity

      t.timestamps
    end
  end
end
