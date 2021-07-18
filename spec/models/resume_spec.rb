# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resume, type: :model do
  subject do
    Resume.new(
      resume_name: 'ABC Resume',
      layout_id: '100'
    )
  end

  describe 'Validations' do
    it { should belong_to(:user) }

    it 'is not valid without a resume_name' do
      subject.resume_name = nil
      expect(subject).to_not be_valid
    end

    it 'resume_name should not be too short' do
      subject.resume_name = 'a'
      expect(subject).to_not be_valid
    end

    it 'resume_name should not be too long' do
      subject.resume_name = 'a' * 26
      expect(subject).to_not be_valid
    end

    it 'is not valid without a layout_id' do
      subject.layout_id = nil
      expect(subject).to_not be_valid
    end
  end
end
