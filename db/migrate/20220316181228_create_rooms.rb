class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :session_token
      t.string :generated_token
      t.references :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
