class RemoveUseridIndexFromEducation < ActiveRecord::Migration[6.1]
  def change
    remove_index :educations, :user_id
  end
end
