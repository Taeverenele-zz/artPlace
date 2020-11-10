class Artwork < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_one_attached :image, dependent: :destroy
  validates :image, attached: true
  validates :price, numericality: {greater_than: 49}
end
