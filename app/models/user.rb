class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artworks, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :assign_default_role

  def assign_default_role
    add_role(:client)
  end
  def admin?
    has_role?(:admin)
  end
  
  def client?
    has_role?(:client)
  end 
end
