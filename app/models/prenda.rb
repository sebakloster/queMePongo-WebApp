class Prenda < ApplicationRecord

    belongs_to :prenda_tipo
    belongs_to :guardarropa
    has_one :user, through: :guardarropa


    enum tela: [:algodon,:lino,:jean,:cuero,:gabardina]

    validates :tela, presence: true
    validates :color_primario, presence: true
    validates :color_secundario, presence: true
   # validates :color_secundario, uniqueness: { scope: :color_primario }
   def MiUser
    this.user
   end
end