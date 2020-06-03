class Guardarropa < ApplicationRecord
    has_many :prendas
    validates :name, presence: true
end