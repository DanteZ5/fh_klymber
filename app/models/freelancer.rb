class Freelancer < ApplicationRecord
  has_one :request

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :bio, presence: true
end
