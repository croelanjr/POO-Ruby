=begin
Pregunta 1
Desarrolle sus clases en Ruby que permita realizar el siguiente programa:
auto = Auto.new(“Volvo”, 19,000) 
neto = auto.calcular_neto(2) 
puts “Neto: #{neto}” donde el método calcular_neto(2)
debe calcular el costo de dos autos Volvo con precio 19,000 
y además le suma IGV que es una constante 0.18.
=end

class Auto
	attr_accessor :marca, :precio, :cantidad

  def initialize(marca,precio)
  	@marca = marca
  	@precio = precio
  end

  def calcular_neto(cantidad)
   	puts 'Cantidad ' + cantidad.to_s
   	puts 'Total ' + (precio * cantidad).to_s
   	puts 'IGV ' + ((precio * cantidad) * 0.18).to_s
   	return (precio * cantidad) - ((precio * cantidad) * 0.18)  
  end
  
  def pantalla
  	puts 'Marca : ' + marca + ' Precio : ' + precio.to_s	
  end
end

auto = Auto.new("Volvo", 19000) 
puts auto.pantalla
neto = auto.calcular_neto(2)
puts "Neto: #{neto}"