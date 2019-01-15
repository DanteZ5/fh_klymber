class WaitingList < ApplicationRecord
  belongs_to :request

  scope :expired?, -> { where(expired: true) }
end
