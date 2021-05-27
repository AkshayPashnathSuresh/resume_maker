# frozen_string_literal: true

require 'rails_helper'
require 'model_helper'

RSpec.describe Education, type: :model do
  subject do
    Education.new(
      institution_name: 'ABC University',
      course_name: 'Bachelor of Technology',
      studied_from: '2014/05/10',
      grade_point: '9.8 cgpa',
      achivements: 'My achivements in ABC university'
    )
  end
  describe 'Validations' do
    it { should belong_to(:user) }

    it 'is not valid without an institution name' do
      subject.institution_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a course name' do
      subject.course_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a studied from date' do
      subject.studied_from = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a grade point' do
      subject.grade_point = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without aa achivements' do
      subject.achivements = ''
      expect(subject).to_not be_valid
    end

    it 'should not contain more than 50 words in an achivement' do
      subject.achivements = ModelHelper::PARAGRAPH_VALIDATOR_INPUT
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end
end
