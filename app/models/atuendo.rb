class Atuendo < ApplicationRecord
    has_one :prenda_torso, class_name: "Prenda"
    has_one :prenda_pies, class_name: "Prenda"
    has_one :prenda_cabeza, class_name: "Prenda"
    has_one :prenda_piernas, class_name: "Prenda"
end
