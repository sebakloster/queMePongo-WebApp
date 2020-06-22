# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    
  #  prenda1=Prenda.create({categoria: 0, tipo: 1, tela: 0, color_primario: 'azul', color_secundario: 'Celeste'})
    # prenda2=Prenda.create({categoria: 3, tipo: 2, tela: 2, color_primario: 'rojo', color_secundario: 'blanco'})
   # prenda3=Prenda.create({categoria: 2, tipo: 3, tela: 2, color_primario: 'verde', color_secundario: 'naranja'})
   # prenda4=Prenda.create({categoria: 1, tipo: 0, tela: 3, color_primario: 'amarillo', color_secundario: 'Beige'})
   # prenda5=Prenda.create({categoria: 1, tipo: 2, tela: 1, color_primario: 'violeta', color_secundario: 'dorado'})

 PrendaTipo.create categoria: :cabeza, tipo: :gorro
 PrendaTipo.create categoria: :piernas, tipo: :pantalon
 PrendaTipo.create categoria: :torso, tipo: :remera
 PrendaTipo.create categoria: :pies, tipo: :zapatos 

#  Guardarropa.create name: "Guardarropa 1"
#  Guardarropa.create name: "Guardarropa 2"
#  Guardarropa.create name: "Guardarropa 3"
#  Guardarropa.create name: "Guardarropa 4"



#   Prenda.create tela: :lino, color_primario: 'Cyan', color_secundario: 'violeta', prenda_tipo_id: 1, guardarropa_id: 1
#   Prenda.create tela: :algodon, color_primario: 'azul', color_secundario: 'Celeste', prenda_tipo_id: 3, guardarropa_id: 1
#   Prenda.create tela: :cuero, color_primario: 'blanco', color_secundario: 'negro', prenda_tipo_id: 2, guardarropa_id: 1



#   Prenda.create tela: :lino, color_primario: 'Cyan', color_secundario: 'Violeta', prenda_tipo_id: 1, guardarropa_id: 3
#   Prenda.create tela: :algodon, color_primario: 'Azul', color_secundario: 'Celeste', prenda_tipo_id: 2, guardarropa_id: 3
#   Prenda.create tela: :cuero, color_primario: 'Blanco', color_secundario: 'Negro', prenda_tipo_id: 3, guardarropa_id: 3
#   Prenda.create tela: :jean, color_primario: 'Verde', color_secundario: 'Amarillo', prenda_tipo_id: 4, guardarropa_id: 3

#   Prenda.create tela: :algodon, color_primario: 'Verde', color_secundario: 'Beige', prenda_tipo_id: 1, guardarropa_id: 3
#   Prenda.create tela: :gabardina, color_primario: 'Amarillo', color_secundario: 'Celeste', prenda_tipo_id: 2, guardarropa_id: 3
#   Prenda.create tela: :cuero, color_primario: 'Purpura', color_secundario: 'Bordo', prenda_tipo_id: 3, guardarropa_id: 3
#   Prenda.create tela: :gabardina, color_primario: 'Marron', color_secundario: 'amarillo', prenda_tipo_id: 4, guardarropa_id: 3

#   Prenda.create tela: :lino, color_primario: 'Cyan', color_secundario: 'violeta', prenda_tipo_id: 1, guardarropa_id: 2
#   Prenda.create tela: :algodon, color_primario: 'azul', color_secundario: 'Celeste', prenda_tipo_id: 2, guardarropa_id: 2
#   Prenda.create tela: :cuero, color_primario: 'blanco', color_secundario: 'negro', prenda_tipo_id: 3, guardarropa_id: 2
#   Prenda.create tela: :jean, color_primario: 'verde', color_secundario: 'amarillo', prenda_tipo_id: 4, guardarropa_id: 2

#   Prenda.create tela: :lino, color_primario: 'Cyan', color_secundario: 'violeta', prenda_tipo_id: 1, guardarropa_id: 4
#   Prenda.create tela: :algodon, color_primario: 'azul', color_secundario: 'Celeste', prenda_tipo_id: 2, guardarropa_id: 4
#   Prenda.create tela: :cuero, color_primario: 'blanco', color_secundario: 'negro', prenda_tipo_id: 3, guardarropa_id: 4
#   Prenda.create tela: :jean, color_primario: 'verde', color_secundario: 'amarillo', prenda_tipo_id: 4, guardarropa_id: 4


  # User.create email: "admin@gmail.com", password_digest: "ejemplo1234", created_at: "2020-06-21 21:00", updated_at: "2020-06-21 21:00:32", admin: true
  # User.create email: "ej1@gmail.com", password_digest: "ejemplo1234", created_at: "2020-06-21 21:00", updated_at: "2020-06-21 21:00:32", admin: true
  # User.create email: "ej2@gmail.com", password_digest: "ejemplo1234", created_at: "2020-06-21 21:00", updated_at: "2020-06-21 21:00:32", admin: true
  # User.create email: "ej3@gmail.com", password_digest: "ejemplo1234", created_at: "2020-06-21 21:00", updated_at: "2020-06-21 21:00:32", admin: true

  