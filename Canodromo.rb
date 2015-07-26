#encoding:UTF-8
=begin
Caso 2 : Un casino desea desarrollar un canódromo virtual. 
Para ello quieren definir a cada uno de los perros corredores. 
Estos llevan como identificación un nombre, un número de pista 
(del 1 al 7) y una velocidad base (entre 1 y 10). Se necesita 
que el perro pueda mostrar sus datos de la siguiente manera:
Nombre : <<el nombre del perro>> Número : <<el número del perro>>
En el caso de la velocidad se requiere que se cree un método 
llamado velocidad_carrera que permita calcular la velocidad 
para una carrera particular. Cada vez que el perro corre puede
generar una velocidad diferente. Para ello la fórmula es la 
siguiente:

Velocidad de Carrera = velocidad base + número aleatorio entre 1 y 10

Para generar el número aleatorio se pide investigar cómo se puede 
lograr que se genere y con ello desarrollar la fórmula.

TIPS:
Se puede utilizar esta documentación para investigar la 
generación de valores aleatorios mediante random http://rubydoc.
org//core2.2.0/Random.html

Tener en cuenta que los valores de la velocidad son números enteros.
=end

class Canodromo

	attr_accessor :nombre_perro, :numero, :pista, :velocidad

 def initialize(nombre_perro, numero, pista, velocidad)
 	@nombre_perro = nombre_perro
 	@numero = numero
 	@pista = pista
 	@velocidad = velocidad
 end

 def mostrar
 	puts "Nombre del Perro : " + nombre_perro
 	puts "Numero del Perro : " + numero.to_s
 	puts "Pista : " + pista.to_s
 	puts "Velocidad : " + velocidad.to_s + " Km/hora"
 end 

 def velocidad_carrera
 	return velocidad + Random.rand(1...10)
 end
end

perro01 = Canodromo.new("Thor", 10, 1, 4)
perro02 = Canodromo.new("Jack", 23, 2, 6)
perro03 = Canodromo.new("Bubu", 11, 3, 3)
perro04 = Canodromo.new("Afrodita", 87, 4, 5)
perro05 = Canodromo.new("Hercules", 32, 5, 9)
perro06 = Canodromo.new("Goku", 33, 6, 8)
perro07 = Canodromo.new("Trunk", 22, 7, 7)


puts "Lista de Corredores de Perros"
puts "-----------------------------"
puts perro01.mostrar
puts perro02.mostrar
puts perro03.mostrar
puts perro04.mostrar
puts perro05.mostrar
puts perro06.mostrar
puts perro07.mostrar

puts ""
puts "Generando La Velocidad de la Carrera"
puts "------------------------------------"

puts perro01.mostrar
puts "Velocidad generada : " + perro01.velocidad_carrera.to_s + " Km/hora"
puts "------------------------------------"
puts perro02.mostrar
puts "Velocidad generada : " + perro02.velocidad_carrera.to_s + " Km/hora"
puts "------------------------------------"
puts perro03.mostrar
puts "Velocidad generada : " + perro03.velocidad_carrera.to_s + " Km/hora"
puts "------------------------------------"
puts perro04.mostrar
puts "Velocidad generada : " + perro04.velocidad_carrera.to_s + " Km/hora"
puts "------------------------------------"
puts perro05.mostrar
puts "Velocidad generada : " + perro05.velocidad_carrera.to_s + " Km/hora"
puts "------------------------------------"
puts perro06.mostrar
puts "Velocidad generada : " + perro06.velocidad_carrera.to_s + " Km/hora"
puts "------------------------------------"
puts perro07.mostrar
puts "Velocidad generada : " + perro07.velocidad_carrera.to_s + " Km/hora"