# frozen_string_literal: true

FactoryBot.define do
  factory :education do
    institution_name { 'ABC University' }
    course_name { 'Bachelor of Technology' }
    studied_from { '2014/05/10' }
    grade_point { '9.8 cgpa' }
    achivements { 'My achivements in ABC university' }

    trait :invalid do
      institution_name { nil }
    end
  end
end
