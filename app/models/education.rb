# frozen_string_literal: true

class Education < ApplicationRecord
  belongs_to :user
  validates :institution_name, presence: true
  validates :course_name, presence: true
  validates :studied_from, presence: true
  validates :grade_point, presence: true
  validates :achivements, presence: true, Paragraph: true
end
