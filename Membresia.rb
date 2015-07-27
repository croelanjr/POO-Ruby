=begin
Un Club de Socios de Asia ha decidido desarrollar un programa para gestionar 
los datos de sus socios y el cálculo de la membresía anual.
A los socios se les solicita su número de DNI, nombre y apellido, y edad. 
Los socios pueden ser fundadores, invitados u honorarios.
En el caso de los socios fundadores e invitados se solicita además la cantidad 
de dependientes a su cargo (sólo el número, esposa + hijos menores de 18 años).

La membresía anual se calcula de esta forma:
Membresía anual (en soles) = Factor_edad * 200 + Dependientes * 100

Donde: 
Factor_edad = 5, si la edad del socio está entre 18 y 30 años.
Factor_edad = 4, si la edad del socio está entre 31 y 50 años.
Factor_edad = 3, si la edad del socio es mayor a 51 años.

Los socios fundadores tienen además un descuento del 20% en la membresía anual.
Y en el caso de los socios honorarios la membresía anual es simplemente 200 soles
(no se tiene en cuenta la fórmula general pues no se les permite dependientes).

Desarrollar las clases y sus relaciones usando herencia y polimorfismo. 
Elaborar un método que permita el cálculo de la Membresía anual de cada socio.
Elaborar un método que liste los socios del club indicando su tipo y su membresía anual a 
pagar.
Elaborar un método que muestre el total a recaudar por membresías. 
=end

class Membresia

	attr_accessor :arreglo, :nombre, :dni, :edad, :dependiente, :tipo

	def initialize(arreglo)
		@arreglo = arreglo
	end

	def factores(edad)
		factor = 0
		case edad
		when 18..30
			factor = 5
		when 31..50
			factor = 4
		when 51..99
			factor = 3
		end
		return factor 		
	end

	def calcular_membresia_cada_socio
		costo_total = 0.00
		puts "------------------ Consulta de Membresia de cada Socio ---------------"
		@arreglo.each do |mm|
			if mm.tipo == "Fundadores"
				numero_factor = factores(mm.edad)
				costo = (numero_factor * 200.0) + (mm.dependiente * 100.0)
				costo_total = costo - (costo * 0.20)
			elsif mm.tipo == "Honorarios"
				costo_total = 200.00
			elsif mm.tipo == "Invitados"
				numero_factor = factores(mm.edad)
				costo_total = (numero_factor * 200.0) + (mm.dependiente * 100.0)
			end
			puts "Nombre y Apelllidos : " + mm.nombre
			puts "DNI Nro. : " + mm.dni
			puts "Edad : " + mm.edad.to_s
			puts "Dependientes : " + mm.dependiente.to_s
			puts "Tipo de Socio : " + mm.tipo
			puts "Costo de Membresía : S/. " + costo_total.round(2).to_s
			puts "----------------------------------------------------------------------"
		end
	end

	def listado_membresia_socio
		costo_total = 0.00
		totales = 0.0
		puts "------------------ Listado Membresia de los Socios ---------------"
		@arreglo.each do |mm|
			if mm.tipo == "Fundadores"
				numero_factor = factores(mm.edad)
				costo = (numero_factor * 200.0) + (mm.dependiente * 100.0)
				costo_total = costo - (costo * 0.20)
			elsif mm.tipo == "Honorarios"
				costo_total = 200.00
			elsif mm.tipo == "Invitados"
				numero_factor = factores(mm.edad)
				costo_total = (numero_factor * 200.0) + (mm.dependiente * 100.0)
			end
			totales = totales + costo_total
			puts "Nombre y Apelllidos : " + mm.nombre
			puts "DNI Nro. : " + mm.dni
			puts "Edad : " + mm.edad.to_s
			puts "Dependientes : " + mm.dependiente.to_s
			puts "Tipo de Socio : " + mm.tipo
			puts "Costo de Membresía Anual a pagar : S/. " + costo_total.round(2).to_s
			puts "----------------------------------------------------------------------"
		end
		puts "Totales de la Membresía Anual de todos los socios es : S/. " + totales.to_s
	end

end

class Socio

	attr_accessor :nombre, :dni, :edad, :dependiente, :tipo

	def initialize(nombre, dni, edad, dependiente, tipo)
		@nombre = nombre
		@dni = dni
		@edad = edad
		@dependiente = dependiente
		@tipo = tipo
	end
end

arreglo = Array.new

socio01 = Socio.new("Miguel Grau", "10260421", 25, 3, "Fundadores")
socio02 = Socio.new("Francisco Pizarro", "10260422", 30, 4, "Invitados")
socio03 = Socio.new("Alfonzo Ugarte", "10260423", 40, 2, "Honorarios")
socio04 = Socio.new("Jorge Chavez", "10260424", 38, 5, "Fundadores")

arreglo << socio01
arreglo << socio02
arreglo << socio03
arreglo << socio04

consulta01 = Membresia.new(arreglo)
consulta01.calcular_membresia_cada_socio
consulta01.listado_membresia_socio