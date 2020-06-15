class Atuendo < ApplicationRecord
    has_one :torso, class_name: "Prenda"
    has_one :pies, class_name: "Prenda"
    has_one :cabeza, class_name: "Prenda"
    has_one :piernas, class_name: "Prenda"

    enum etiqueta_estacion: [:verano, :invierno, :primavera_otonio] 
    enum etiqueta_tiempo: [:dia, :noche] 
    enum etiqueta_formalidad: [:formal, :informal] 

    validates :etiqueta_estacion, presence: false
    validates :etiqueta_tiempo, presence: false
    validates :etiqueta_formalidad, presence: false

    validates :torso_id, presence: true
    validates :piernas_id, presence: true
    validates :pies_id, presence: true
    validates :cabeza_id, presence: true


end
