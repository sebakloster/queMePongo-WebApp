class Prenda < ApplicationRecord

    belongs_to :prenda_tipo

    enum tipo: [:pantalon,:remera,:Zapatos,:gorro]
    enum tela: [:algodon,:lino,:jean,:cuero,:gabardina]

    validates :tela, presence: true
    validates :tipo, presence: true
    validates :color_primario, presence: true
    validates :color_secundario, presence: true
end