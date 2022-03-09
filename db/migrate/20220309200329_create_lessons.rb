class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :start_time
      t.string :end_time
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
