class Guardarropa < ApplicationRecord
    has_many :prendas, dependent: :destroy
    has_many :atuendos, dependent: :destroy
    belongs_to :user
    validates :name, presence: true

    def prendas_cabeza
        Prenda.where(prenda_tipo_id: 1)
    end
    def prendas_torso
        Prenda.where(prenda_tipo_id: 2)
    end
    def prendas_piernas
        Prenda.where(prenda_tipo_id: 3)
    end
    def prendas_pies
        Prenda.where(prenda_tipo_id: 4)
    end
end