# frozen_string_literal: true

FactoryBot.define do
  factory :resume do
    resume_name { 'ABC Resume' }
    layout_id { '100' }

    trait :invalid do
      resume_name { nil }
    end
  end
end
