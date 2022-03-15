class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.text :notes
      t.boolean :completed

      t.timestamps
    end
  end
end
