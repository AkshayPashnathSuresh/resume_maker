class RemoveUserIdIndexFromWork < ActiveRecord::Migration[6.1]
  def change
    remove_index :works, :user_id
  end
end
