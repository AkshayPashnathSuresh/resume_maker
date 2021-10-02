# frozen_string_literal: true

class User < ApplicationRecord
  has_one :personal, dependent: :delete
  has_one :address, dependent: :delete
  has_many :educations, dependent: :delete_all
  has_many :works, dependent: :delete_all
  has_many :projects, dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
