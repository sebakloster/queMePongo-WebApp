class PrendaTipo < ApplicationRecord
    has_one :prenda
    enum categoria: [:cabeza, :torso, :piernas, :pies] 
    enum tipo: [:zapatos, :remera, :pantalon, :gorro] 
    validates :categoria, presence: true
    validates :tipo, presence: true
end