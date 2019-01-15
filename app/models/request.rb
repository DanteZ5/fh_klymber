class Request < ApplicationRecord
  validates :name, presence: { message: 'Ce champ ne peut être vide' }
  validates :email, presence: { message: 'Ce champ ne peut être vide' }
  validates :email, uniqueness: { message: 'Cet email est déjà pris' }
  validates :email, format: { with: /\A.*@.*\..*\z/, message: "L'email est invalide" }
  validates :phone, presence: { message: 'Ce champ ne peut être vide' }
  validates :phone, uniqueness: { message: 'Ce numéro est déjà pris' }
  validates :phone, format: { with: /((\+)33|0|0033)[1-9](\d{2}){4}/, message: 'Le numéro doit commencer par +33, 0033 ou 0 suivi de 9 chiffres' }
  validates :bio, presence: { message: 'Ce champ ne peut être vide' }
  validates :bio, length: { minimum: 10, message: 'La bio doit contenir au moins 10 caractères' }

  scope :unconfirmed, -> { where(status: 'unconfirmed') }
  scope :confirmed, -> { where(status: 'confirmed') }
  scope :accepted, -> { where(status: 'accepted') }
  scope :expired, -> { where(status: 'expired') }

  def accept!
    self.status = 'accepted'
    self.save!
  end
end
