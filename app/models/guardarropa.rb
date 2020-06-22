class Guardarropa < ApplicationRecord
    has_many :prendas, dependent: :destroy
    has_many :atuendos, dependent: :destroy
    belongs_to :user
    validates :name, presence: true
end