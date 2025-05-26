class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  has_many :books, dependent: :destroy
  has_one_attached :profile_image


  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }  
end
