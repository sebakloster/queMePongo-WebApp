class Prenda < ApplicationRecord

    belongs_to :prenda_tipo
    belongs_to :guardarropa
    belongs_to :user


    enum tela: [:algodon,:lino,:jean,:cuero,:gabardina]

    validates :tela, presence: true
    validates :color_primario, presence: true
    validates :color_secundario, presence: true
   # validates :color_secundario, uniqueness: { scope: :color_primario }
end