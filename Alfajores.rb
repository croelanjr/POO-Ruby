=begin
La tienda Azul vende solo alfajores en cajas de 10, 20 y 50 alfajores de un mismo tipo en cada caja.
 Existen tres tipos de alfajores, de “Manjar”, “Anis” y “Limeñita”
Se necesita almacenar 360 alfajores de tipo “Manjar”, 
300 alfajores de tipo “Anis” y 2000 alfajores de tipo “Limeñita”,
 con preferencia en cajas más grandes e imprima la cantidad de cajas necesarias para cada tipo.
  Use arreglos para almacenar los tipos, cantidades y número de cajas que le corresponden y 
  muestre sus resultados en consola.
=end
class Alfajores
	
	attr_accessor :alfajor, :tipo, :cantidad

	def initialize(tipo,cantidad)
		@tipo = tipo
		@cantidad = cantidad
	end
end


class Cajas
	attr_accessor :alfajores

	@alfajores = Array.new
	
	def self.crear_cajas
		alfajor01 = Alfajores.new("Manjar", 360)
		alfajor02 = Alfajores.new("Anis", 300)
		alfajor03 = Alfajores.new("Limeñita", 2000)

		@alfajores << alfajor01
		@alfajores << alfajor02
		@alfajores << alfajor03
	end

	def self.calcular
		@alfajores.each do |alfa|
			comparte = alfa.cantidad
			tajada50 = (comparte / 50)
			comparte = (comparte % 50)
			tajada20 = (comparte / 20)
			comparte = (comparte % 20)
			tajada10 = (comparte / 10)
			comparte = (comparte % 10)
			puts "-----------------------------------------------------"
			puts "El tipo de alfajor #{alfa.tipo} :"
			puts "la caja de 50 va a necesitar : #{tajada50.to_s} cajas"
			puts "la caja de 20 va a necesitar : #{tajada20.to_s} cajas"
			puts "la caja de 10 va a necesitar : #{tajada10.to_s} cajas"
			puts "-----------------------------------------------------"
		end
	end

	def self.resultado
		crear_cajas
		puts "---------------------------------"
		calcular
	end
end

Cajas.resultado