class Guardarropa < ApplicationRecord
    before_destroy :borrarAtuendos
    has_many :prendas, dependent: :destroy
    has_many :atuendos, dependent: :destroy
    belongs_to :user
    validates :name, presence: true

    def prendas_cabeza
        self.prendas.where(prenda_tipo_id: 1)
    end
    def prendas_torso
        self.prendas.where(prenda_tipo_id: 2)
    end
    def prendas_piernas
        self.prendas.where(prenda_tipo_id: 3)
    end
    def prendas_pies
        self.prendas.where(prenda_tipo_id: 4)
    end

    def borrarAtuendos
        self.atuendos.destroy_all
    end

end