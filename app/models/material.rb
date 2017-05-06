class Material < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> (current_user) { where(user: current_user).order(:name) }

  paginates_per 10
end
