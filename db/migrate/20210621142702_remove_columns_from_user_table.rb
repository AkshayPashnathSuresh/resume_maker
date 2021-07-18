class RemoveColumnsFromUserTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :area_of_interests, :text
    remove_column :users, :technical_skills, :text
    remove_column :users, :known_languages, :text
    remove_column :users, :personal_profile, :text
    remove_column :users, :carreer_objective, :text
  end
end
