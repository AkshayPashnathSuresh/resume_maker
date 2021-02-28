class AddRemainingfieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :area_of_interests, :text
    add_column :users, :technical_skills, :text
    add_column :users, :known_languages, :text
    add_column :users, :personal_profile, :text
    add_column :users, :carreer_objective, :text
  end
end
