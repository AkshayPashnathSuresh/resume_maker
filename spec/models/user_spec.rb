# frozen_string_literal: true

require 'rails_helper'
require 'model_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      email: 'example@example.com',
      password: 'password'
    )
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_one(:personal) }
    it { should have_one(:address) }
    it { should have_many(:educations).class_name('Education') }
    it { should have_many(:works).class_name('Work') }
  end
end
