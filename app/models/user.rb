class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artworks, dependent: :destroy
  has_many :sales
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end
  def admin?
    has_role?(:admin)
  end
  
  def client?
    has_role?(:client)
  end
end
