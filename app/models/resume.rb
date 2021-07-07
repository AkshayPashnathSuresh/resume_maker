class Resume < ApplicationRecord
  belongs_to :user
  validates :resume_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :layout_id, presence: true
end
