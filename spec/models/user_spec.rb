require 'rails_helper'
require 'model_helper'

RSpec.describe User, :type => :model do
  subject {
    User.new(
            email: "example@example.com",
            password: "password",
            first_name: "first name",
            last_name: "last name",
            technical_skills: "technical skills",
            known_languages: "known languages",
            area_of_interests: "area of interests",
            personal_profile: "personal profile",
            carreer_objective: "carreer objective"
            )
  }

  describe "Validations" do
    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "first name should not be too short" do
      subject.first_name = "a"
      expect(subject).to_not be_valid
    end
    
    it "first name should not be too long" do
      subject.first_name = "a" * 26
      expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "last name should not be too short" do
      subject.last_name = "a"
      expect(subject).to_not be_valid
    end
    
    it "last name should not be too long" do
      subject.last_name = "a" * 26
      expect(subject).to_not be_valid
    end

    it "is not valid without a technical skills" do
      subject.technical_skills = ""
      expect(subject).to_not be_valid
    end

    it "should not contain more than 5 skills" do
      subject.technical_skills = ModelHelper::SKILLS_VALIDATOR_INPUT
      expect(subject).to_not be_valid
    end

    it "is not valid without known languages" do
      subject.known_languages = ""
      expect(subject).to_not be_valid
    end

    it "should not contain more than 5 languages" do
      subject.known_languages = ModelHelper::SKILLS_VALIDATOR_INPUT
      expect(subject).to_not be_valid
    end

    it "is not valid without area of interests" do
      subject.area_of_interests = ""
      expect(subject).to_not be_valid
    end

    it "should not contain more than 5 area of interests" do
      subject.area_of_interests = ModelHelper::SKILLS_VALIDATOR_INPUT
      expect(subject).to_not be_valid
    end

    it "is not valid without personal profile" do
      subject.personal_profile = ""
      expect(subject).to_not be_valid
    end
    
    it "should not contain more than 50 words in personal profile" do
      subject.personal_profile = ModelHelper::PARAGRAPH_VALIDATOR_INPUT
      expect(subject).to_not be_valid
    end
    
    it "is not valid without carreer objective" do
      subject.carreer_objective = ""
      expect(subject).to_not be_valid
    end

    it "should not contain more than 50 words in carreer objective" do
      subject.carreer_objective = ModelHelper::PARAGRAPH_VALIDATOR_INPUT
      expect(subject).to_not be_valid
    end

  end
  
end