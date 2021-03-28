# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  validates :company_name, presence: true
  validates :designation, presence: true
  validates :work_from, presence: true
  validates :job_description, presence: true, Paragraph: true
end
