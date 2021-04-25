FactoryBot.define do
  factory :user do
   email { "test@test.com"}
   password { "password" }
   password_confirmation { "password"}
   first_name  { "user1 first name" }
   last_name  { "user1 last name" }
   technical_skills  { "technical skills" }
   known_languages  { "known languages" }
   area_of_interests  { "area of interests" }
   personal_profile  { "personal profile" }
   carreer_objective  { "carreer objective" }
   
   trait :invalid do
    first_name {nil}
   end

   trait :user2 do
    first_name  { "user2 first name" }
   end
   
   factory :user2, :traits => [:user2]
  end
end