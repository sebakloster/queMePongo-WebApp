class User < ApplicationRecord
  has_secure_password 
  validates :password, length: { minimum: 8, maximum: 16 }, on: :create

  validates :email, uniqueness: true, presence: true
  has_many :guardarropas, dependent: :destroy
  has_many :atuendos, dependent: :destroy
  has_many :prendas, dependent: :destroy
end
