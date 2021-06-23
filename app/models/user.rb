# frozen_string_literal: true

class User < ApplicationRecord
  has_many :personals
  has_one :address
  has_one :education
  has_one :work
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
