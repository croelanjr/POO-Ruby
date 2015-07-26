#encoding:UTF-8
=begin
defina una clase denominada Cuenta de un cliente de un banco, con las propiedades
 código, nombre, DNI y saldo.
Realizar un programa tal que se inicialice los datos de un cliente dado y luego se pueda actualizar
 su saldo con un monto que se le pasará como parámetro.
Pruebe con los siguientes datos: Código=2324325, nombre=”Luis Perez”, DNI=”09384567” y 
saldo=200 soles
Incremente el saldo con 300 soles
Muestre los datos de cliente y su nuevo saldo.
=end
class Cuenta
	def initialize(codigo, nombre, dni)
		@codigo = codigo
		@nombre = nombre
		@dni = dni
		@detalles=Array.new
		
    end
    
    def agregar_detalle(saldo, nuevo_saldo)
     	detalle = Detalle_saldo.new(saldo, nuevo_saldo)
     	@detalles << detalle
    end 

    def reporte
    	mensaje = ""
        mensaje += "Nombre : #{@nombre} \n"
        mensaje += "Codigo: #{@codigo} \n"
        mensaje += "Dni: #{@dni} \n"
        mensaje += "==========DETALLE========  \n"
        @detalles.each do |detalle|
               mensaje += detalle.mostrar_detalle + "\n"   
        end
        mensaje += ""
    end

  
end

class Detalle_saldo
	attr_reader:total_detalle
	def initialize(saldo, nuevo_saldo)
		@saldo = saldo
		@nuevo_saldo = nuevo_saldo
	end
	def calcular_nuevo_saldo
		@total_detalle = @saldo + @nuevo_saldo
	end
	
	def mostrar_detalle
    "El saldo anterior es: #{@saldo} y El nuevo saldo es: #{calcular_nuevo_saldo}"
    end	
end


cliente01=Cuenta.new("2324325", "Luis Peres", "09384567") 
cliente01.agregar_detalle(200, 300)

puts cliente01.reporte