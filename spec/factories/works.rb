# frozen_string_literal: true

FactoryBot.define do
  factory :work do
    company_name { 'ABC Company' }
    designation { 'Chief Technical Officer' }
    work_from { '2014/05/10' }
    job_description { 'Manage technical resources and ensure they are geared towards technological development.' }

    trait :invalid do
      company_name { nil }
    end
  end
end
