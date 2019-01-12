class Freelancer < ApplicationRecord
  has_one :request

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\..*\z/ }
  validates :phone, presence: true, uniqueness: true, format: { with: /((\+)33|0|0033)[1-9](\d{2}){4}/ }
  validates :bio, presence: true, length: { minimum: 10 }
  validates :key, presence: true, uniqueness: true
end
