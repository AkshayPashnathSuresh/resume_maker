class CreatePersonals < ActiveRecord::Migration[6.1]
  def change
    create_table :personals do |t|
      t.string :first_name
      t.string :last_name
      t.text :area_of_interests
      t.text :technical_skills
      t.text :known_languages
      t.text :personal_profile
      t.text :carreer_objective
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
