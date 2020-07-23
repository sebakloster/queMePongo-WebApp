class Atuendo < ApplicationRecord

    scope :filter_by_estacion, -> (estacion) { where etiqueta_estacion: estacion if estacion }
    scope :filter_by_formalidad, -> (formalidad) { where etiqueta_formalidad: formalidad if formalidad }
    scope :filter_by_tiempo, -> (tiempo) { where etiqueta_tiempo: tiempo if tiempo }
    scope :ordered_by_puntaje, -> (orden) { order(puntaje: orden) if orden }

    belongs_to :torso, class_name: "Prenda"
    belongs_to :pies, class_name: "Prenda"
    belongs_to :cabeza, class_name: "Prenda"
    belongs_to :piernas, class_name: "Prenda"
    belongs_to :guardarropa
    has_one :user, through: :guardarropa


    enum etiqueta_estacion: [:verano, :invierno, :primavera_otonio] 
    enum etiqueta_tiempo: [:dia, :noche] 
    enum etiqueta_formalidad: [:formal, :informal] 

    validates :etiqueta_estacion, presence: false
    validates :etiqueta_tiempo, presence: false
    validates :etiqueta_formalidad, presence: false
    validates_inclusion_of :puntaje, :in => 0..5

    validates :torso_id, presence: true
    validates :piernas_id, presence: true
    validates :pies_id, presence: true
    validates :cabeza_id, presence: true
end
