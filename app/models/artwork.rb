class Artwork < ApplicationRecord
  belongs_to :user
  has_one :sale, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validates :title, length: {minimum: 3, maximum: 20}
  validates :description, length: {minimum: 10, maximum: 200}
  validates :image, attached: true
  validates :price, numericality: {greater_than: 1, message: " must be greater than 49 cents"}
  validates :price, numericality: {less_than: 1000, message: " must be less than $1000"}
  attribute :availability, default: true
end
