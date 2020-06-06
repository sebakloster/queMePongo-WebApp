class Guardarropa < ApplicationRecord
    has_many :prendas, dependent: :destroy
    validates :name, presence: true
end