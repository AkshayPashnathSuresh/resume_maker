# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user
  validates :nationality, presence: true
  validates :province, presence: true
  validates :city, presence: true
  validates :remaining_address, presence: true
  validates :country, presence: true
  validates :post_cd, presence: true
  # validates :mail_id, presence: true
  validates :phone_no, presence: true
  validates :linkedIn_url, presence: true
  validates :twitter_url, presence: true
  validates :repository_url, presence: true, if: :repository?
  validates_format_of :post_cd,
                      with: /\A\d{3}-\d{4}|\A\d{5}\z/,
                      message: 'should be in the format 123-1234 or 123456'
  def self.hosting_services
    ['Select your hosting service', 'Github', 'Bitbucket']
  end

  def repository?
    Address.hosting_services[1, 2].include? hosting_service
  end
end
