class AddUserIdToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :user_id, :integer
    add_foreign_key :images, :users
  end
end
