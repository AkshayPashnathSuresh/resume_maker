# frozen_string_literal: true

class User < ApplicationRecord
  has_one :personal
  has_one :address
  has_many :educations
  has_many :works
  has_many :projects
  has_many :resumes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
