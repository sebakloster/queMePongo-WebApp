module TipoHelper
    def iconSelector(prenda)
        case prenda.prenda_tipo.tipo.to_sym
        when :zapatos
          'https://img.icons8.com/material/48/000000/mens-shoe.png'
        when :remera
          'https://img.icons8.com/material/48/000000/t-shirt--v1.png'
        when :pantalon
          'https://img.icons8.com/material/48/000000/trousers.png'
        when :gorro
          'https://img.icons8.com/material/48/000000/detective-hat.png'
        end
    end
end