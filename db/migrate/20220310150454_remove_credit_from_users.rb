class RemoveCreditFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :credit
  end
end
