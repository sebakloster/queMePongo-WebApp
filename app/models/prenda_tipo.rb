class PrendaTipo < ApplicationRecord
    has_one :prenda
    enum categoria: [:cabeza, :torso, :piernas, :pies] 

    validates :categoria, presence: true
end