#encoding:UTF-8
=begin
Caso 4 : Una empresa de arquitectura está implementando un 
sistema de presupuestos automáticos. Para ello requiere 
que la presentación muestra un mensaje de esta forma:

Carlos Perez, el presupuesto calculado es: 2983.12

Este mensaje debe ser mostrado en una sola cadena. 

Para ello se pide crear una clase cuyos atributos sean el nombre 
de la persona y el monto a pagar. 

TIPS : 
Se puede investigar la conversión de valores flotantes a 
cadenas (string) aquí:
http://ruby-doc.org/core-2.1.2/Float.html


Tener en cuenta que los valores de la velocidad son números enteros.
=end

class Presupuesto

	attr_accessor :nombre_cliente, :monto_presupuesto

 def initialize(nombre_cliente, monto_presupuesto)
 	@nombre_cliente = nombre_cliente
 	@monto_presupuesto = monto_presupuesto
 end

 def mostrar
 	return nombre_cliente + ', el presupuesto calculado es : ' + monto_presupuesto[0].round(2).to_s
 end 

end

presupuesto01 = Presupuesto.new("Miguel Grau", [2342.24353])
presupuesto02 = Presupuesto.new("Francisco Bolognesi", [3442.25345])
presupuesto03 = Presupuesto.new("Chavin de Huantar", [5542.35340])
presupuesto04 = Presupuesto.new("Alfonso Ugarte", [65462.25345])
presupuesto05 = Presupuesto.new("Perricholi Garcia", [5542.55346])
presupuesto06 = Presupuesto.new("Atahualpa Tupayachi", [8565.55343])


puts "Lista de Presupuesto de clientes"
puts "--------------------------------"
puts presupuesto01.mostrar
puts presupuesto02.mostrar
puts presupuesto03.mostrar
puts presupuesto04.mostrar
puts presupuesto05.mostrar
puts presupuesto06.mostrar