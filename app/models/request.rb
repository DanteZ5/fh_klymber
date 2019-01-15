class Request < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\..*\z/ }
  validates :phone, presence: true, uniqueness: true, format: { with: /((\+)33|0|0033)[1-9](\d{2}){4}/ }
  validates :bio, presence: true, length: { minimum: 10 }

  scope :unconfirmed, -> { where(status: 'unconfirmed') }
  scope :confirmed, -> { where(status: 'confirmed') }
  scope :accepted, -> { where(status: 'accepted') }
  scope :expired, -> { where(status: 'expired') }

  def accept!
    self.status = 'accepted'
    self.save!
  end
end
