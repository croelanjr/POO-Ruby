#encoding:UTF-8
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
 
 attr_accessor :auto01, :auto02

  def initialize(auto01,auto02)
	@auto01 = auto01
	@auto02 = auto02
  end

  def calcular_neto
  (auto01 + auto02)*0.18 + auto01 + auto02
  end

end

auto = Auto.new(19000, 19000)
neto   = auto.calcular_neto
puts " Neto: #{neto}"