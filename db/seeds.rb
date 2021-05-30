# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'user1@sample.com', password: 'password', first_name:'user1_first_name',
            last_name: 'user1_last_name', technical_skills: 'user1_technical_skills',known_languages: 'user1_known_languages',
            area_of_interests: 'user1_area_of_interests', personal_profile: 'user1_personal_profile', carreer_objective: 'user1_carreer_objective')
User.create(email: 'user2@sample.com', password: 'password', first_name:'user2_first_name',
            last_name: 'user2_last_name', technical_skills: 'user2_technical_skills',known_languages: 'user2_known_languages',
            area_of_interests: 'user2_area_of_interests', personal_profile: 'user2_personal_profile', carreer_objective: 'user2_carreer_objective')