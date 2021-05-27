# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    nationality { 'Indian' }
    province { 'Shimane' }
    city { 'Matsue' }
    remaining_address { 'ABC Building Room no.XXX' }
    country { 'Japan' }
    post_cd { '000-0000' }
    mail_id { 'abc@example.com' }
    phone_no { '000-000-0000' }
    linkedIn_url { 'abc.com/example/linkedInUrl' }
    twitter_url { 'abc.com/example/twitterUrl' }

    trait :invalid do
      nationality { nil }
    end
  end
end
