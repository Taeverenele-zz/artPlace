class Artwork < ApplicationRecord
  belongs_to :user
  has_many :sales, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validates :title, length: {minimum: 3, maximum: 20}
  validates :description, length: {minimum: 10, maximum: 200}
  validates :image, attached: true
  validates :price, numericality: {greater_than: 49, message: " must be greater than 49 cents"}
  attribute :availability, default: true
end
