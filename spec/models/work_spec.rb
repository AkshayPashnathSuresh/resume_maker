# frozen_string_literal: true

require 'rails_helper'
require 'model_helper'

RSpec.describe Work, type: :model do
  subject do
    Work.new(
      company_name: 'ABC Company',
      designation: 'Chief Technical Officer',
      work_from: '2014/05/10',
      job_description: 'Manage technical resources and ensure they are geared towards technological development.'
    )
  end
  describe 'Validations' do
    it { should belong_to(:user) }

    it 'is not valid without an company name' do
      subject.company_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a designation' do
      subject.designation = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a work from date' do
      subject.work_from = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a job_description' do
      subject.job_description = ''
      expect(subject).to_not be_valid
    end

    it 'should not contain more than 50 words in a job_description' do
      subject.job_description = ModelHelper::PARAGRAPH_VALIDATOR_INPUT
      expect(subject).to_not be_valid
    end
  end
end
