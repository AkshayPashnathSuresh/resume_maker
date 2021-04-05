# frozen_string_literal: true

require 'rails_helper'
require 'model_helper'

RSpec.describe Address, type: :model do
  subject do
    Address.new(
      nationality: 'Indian',
      province: 'Shimane',
      city: 'Matsue',
      remaining_address: 'ABC Building Room no.XXX',
      country: 'Japan',
      post_cd: '000-0000',
      mail_id: 'abc@example.com',
      phone_no: '000-000-0000',
      linkedIn_url: 'abc.com/example/linkedInUrl',
      twitter_url: 'abc.com/example/twitterUrl'
    )
  end

  describe 'Validations' do
    it { should belong_to(:user) }

    it 'is not valid without a nationality' do
      subject.nationality = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a province' do
      subject.province = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a city' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a remaining address' do
      subject.remaining_address = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a country' do
      subject.country = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a postal code' do
      subject.post_cd = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a mail id' do
      subject.mail_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a phone number' do
      subject.phone_no = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a linkedIn Url' do
      subject.linkedIn_url = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a twitter Url' do
      subject.twitter_url = nil
      expect(subject).to_not be_valid
    end
  end
end
