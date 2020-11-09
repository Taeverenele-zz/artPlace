class Artwork < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  validates :image, attached: true
end
