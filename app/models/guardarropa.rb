class Guardarropa < ApplicationRecord
    before_destroy :borrar_atuendos
    has_many :prendas, dependent: :destroy
    has_many :atuendos, dependent: :destroy
    belongs_to :user
    validates :name, presence: true

    def prendas_cabeza
        self.prendas.select{|prenda| prenda.prenda_tipo.categoria.to_sym == :cabeza}
    end
    def prendas_torso
        self.prendas.select{|prenda| prenda.prenda_tipo.categoria.to_sym == :torso}
        
    end
    def prendas_piernas
        self.prendas.select{|prenda| prenda.prenda_tipo.categoria.to_sym == :piernas}
    end
    def prendas_pies
        self.prendas.select{|prenda| prenda.prenda_tipo.categoria.to_sym == :pies}
    end

    def borrar_atuendos
        self.atuendos.destroy_all
    end
end