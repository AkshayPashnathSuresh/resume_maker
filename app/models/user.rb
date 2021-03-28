# frozen_string_literal: true

class User < ApplicationRecord
  has_one :address
  has_one :education
  has_one :work
  validates :first_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :technical_skills, presence: true, Skills: true
  validates :known_languages, presence: true, Skills: true
  validates :area_of_interests, presence: true, Skills: true
  validates :personal_profile, presence: true, Paragraph: true
  validates :carreer_objective, presence: true, Paragraph: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
