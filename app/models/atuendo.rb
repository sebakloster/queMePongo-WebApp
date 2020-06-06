class Atuendo < ApplicationRecord
    has_one :torso, class_name: "Prenda"
    has_one :pies, class_name: "Prenda"
    has_one :cabeza, class_name: "Prenda"
    has_one :piernas, class_name: "Prenda"

  # attribute :etiquetas, :string
    serialize :etiquetas, JSON
    attribute :puntaje, :integer

end
