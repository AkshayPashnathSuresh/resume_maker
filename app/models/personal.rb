# frozen_string_literal: true

class Personal < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :first_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :technical_skills, presence: true
  validates :known_languages, presence: true
  validates :area_of_interests, presence: true
  validates :personal_profile, presence: true
  validates :carreer_objective, presence: true
  validates :current_designation, presence: true
end
