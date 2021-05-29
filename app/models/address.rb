# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user
  validates :nationality, presence: true
  validates :province, presence: true
  validates :city, presence: true
  validates :remaining_address, presence: true
  validates :country, presence: true
  validates :post_cd, presence: true
  validates :mail_id, presence: true
  validates :phone_no, presence: true
  validates :linkedIn_url, presence: true
  validates :twitter_url, presence: true
end
