#encoding:UTF-8
=begin
Una empresa de seguros desea una aplicación que permita calcular 
el costo de una prima de seguro según el vehículo a asegurar. 

En el caso de los vehículos se consideran dos posibilidades: 
puede ser un carro de transporte público o un carro de uso particular. 
En caso del carro de transporte público se considera la marca, el modelo, 
año de fabricación, la placa, la cantidad de pasajeros que puede llevar y 
el costo de mercado. En el caso de los carros de transporte particular se 
considera la marca, modelo, el año de fabricación,  el costo de mercado y 
si es un modelo considerado de lujo o no.

Los precios de la prima se consideran de la siguiente manera:

Carros de transporte público: 
precio de mercado * 1.15 / 2.25 - (año actual  - año de fabricación) / 100 * precio de mercado

Carros de transporte privado: 
precio de mercado * 0.5 - (año actual  - año de fabricación) / 100 * precio de mercado

En el caso de ser un modelo de lujo se le debe aumentar un 12%

Se debe considerar que un cliente puede tener uno  o más vehículos 
y se deberá mostrar el total a pagar por todas las primas de un cliente. 

El cliente tendrá un nombre, apellido, DNI y el total a pagar calculado 
por la lista de las primas de sus vehículos.

-Desarrollar un método que me permita calcular la prima de un carro 
de transporte público. 
-Desarrollar un método que me permita calcular la prima de un carro 
de transporte privado. 
-Desarrollar un método que me permita calcular el total a pagar por un cliente. 
=end

class Prima

	attr_accessor :buscar

	def initialize(nombre, dni)
		@nombre = nombre
		@dni = dni
		@informaciones = Array.new
    end

    def agregar_transporte(transporte, tipo, anio_fabricacion, monto)
     	detalles = Informacion_cliente.new(transporte, tipo, anio_fabricacion, monto)
     	@informaciones << detalles
    end

    def nombre_cliente
    	return @nombre
    end

    def calcular_prima(buscar)
    	anio_actual = Time.new
    	total = 0.0
    	@informaciones.each do |informa|
    		if buscar == informa.tipo
    			total = (( informa.monto * 1.15 ) / 2.24 ) - (((anio_actual.year - informa.anio_fabricacion) / 100.0) * informa.monto)
    		elsif buscar == informa.tipo
    			total = ( informa.monto * 0.5 ) - (((anio_actual.year - informa.anio_fabricacion) / 100.0 ) * informa.monto)   			
    		elsif buscar == informa.tipo
    			valor = ( informa.monto * 0.5 ) - (((anio_actual.year - informa.anio_fabricacion) / 100.0 ) * informa.monto)
    			total = valor + (valor * 0.12)
    		end
    	end
    	return total.round(2)
    end


    def calcular_prima_total
    	anio_actual = Time.new
    	total = 0.0
    	totales = 0.0
    	@informaciones.each do |informa|
    		if informa.tipo == "Publico"
    			total = (( informa.monto * 1.15 ) / 2.24 ) - (((anio_actual.year - informa.anio_fabricacion) / 100.0) * informa.monto)
    		elsif informa.tipo == "Privado"
    			total = ( informa.monto * 0.5 ) - (((anio_actual.year - informa.anio_fabricacion) / 100.0 ) * informa.monto)   			
    		elsif informa.tipo == "Lujo"
    			valor = ( informa.monto * 0.5 ) - (((anio_actual.year - informa.anio_fabricacion) / 100.0 ) * informa.monto)
    			total = valor + (valor * 0.12)
    		end
    		totales = totales + total
    	end
    	return totales.round(2)
    end

end

class Informacion_cliente

	attr_reader :transporte, :tipo, :anio_fabricacion, :monto
	
	def initialize(transporte, tipo, anio_fabricacion, monto)
		@transporte = transporte
		@tipo = tipo
		@anio_fabricacion = anio_fabricacion
		@monto = monto
	end
end

cliente01 = Prima.new("Miguel Grau", "10260429")
cliente01.agregar_transporte("Auto", "Publico", 2000, 15000.0)
cliente01.agregar_transporte("Camioneta", "Privado", 2012, 16000.0)
cliente01.agregar_transporte("Auto", "Lujo", 2009, 32000.0)

buscar = "Publico"
puts "El Cliente #{cliente01.nombre_cliente} debe pagar una prima de Carro de Transporte #{buscar} por el Monto S/. #{cliente01.calcular_prima(buscar)}"

cliente02 = Prima.new("Francisco Pizarro", "10260430")
cliente02.agregar_transporte("Auto", "Publico", 2012, 19000.0)
cliente02.agregar_transporte("Camioneta", "Privado", 2000, 26000.0)
cliente02.agregar_transporte("Camioneta", "Lujo", 2011, 22000.0)

buscar = "Privado"
puts "El Cliente #{cliente02.nombre_cliente} debe pagar una prima de Carro de Transporte #{buscar} por el Monto S/. #{cliente02.calcular_prima(buscar)}"


puts "El Cliente #{cliente01.nombre_cliente} deberá pagar por el monto total de la prima S/. #{cliente01.calcular_prima_total}"