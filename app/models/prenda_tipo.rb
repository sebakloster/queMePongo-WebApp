class PrendaTipo < ApplicationRecord
    @cabeza = 1
    @torso = 2
    @piernas = 3
    @pies = 4
    has_one :prenda
    enum categoria: [:cabeza, :torso, :piernas, :pies] 
    enum tipo: [:zapatos, :remera, :pantalon, :gorro] 
    validates :categoria, presence: true
    validates :tipo, presence: true
end