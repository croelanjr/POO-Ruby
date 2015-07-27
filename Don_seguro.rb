=begin
La empresa aseguradora de vehículos “DON SEGURO” ha decidido automatizar 
el cálculo de las primas de seguro contra robo de los vehículos. La empresa registra a sus 
clientes almacenando su DNI, nombre y apellido y teléfono.

Cada cliente puede tener N vehículos. Y por cada vehículo se registra su número de placa, 
marca, modelo, antigüedad (en años) y precio base (el precio cuando el vehículo estaba 0 Kms.). 
Para cualquier vehículo la prima para el año actual se calcula así:

Prima = (Precio base) / (10 * (Antigüedad + 1))

Los vehículos pueden ser autos, camionetas o buses.

En el caso de los autos el cálculo de la prima no varía. 

En el caso de las camionetas se requiere almacenar además el tipo de transmisión que 
puede ser AT (automática) o MN (manual).  Para las camionetas, a la prima de vehículos 
se le recarga un 10% en el caso de transmisión automática.

Para los buses se requiere además el número de ejes y asientos. La prima de los buses es 
diferente y se calcula así:

Prima = (Precio base + asientos * 10) / (Ejes * (Antigüedad + 1))

Desarrollar las clases y sus relaciones usando herencia y polimorfismo. Registrar dos clientes. 
El primero con 1 auto y 1 camioneta, y el segundo con 1 auto y 2 buses. Reportar ambos clientes 
con sus vehículos asegurados y el costo total de las primas a pagar por cliente.
A nivel de la empresa aseguradora calcule el monto total de primas a cobrar e imprima el 
total de vehículos asegurados.
=end

class Don_Seguro

	attr_accessor :suma

	def initialize(nombre, dni, telefono)
		@nombre = nombre
		@dni = dni
		@telefono = telefono
		@informaciones = Array.new
    end

    def agregar_vehiculos(placa, marca, modelo, anio_fabricacion, precio_base, tipo, tipo_vehiculo, asientos, ejes)
     	detalles = Informacion_cliente.new(placa, marca, modelo, anio_fabricacion, precio_base, tipo,tipo_vehiculo, asientos, ejes)
     	@informaciones << detalles
    end

    def calcular_prima_vehiculo
    	total = 0.0
    	monto_prima = 0.0
    	anio_actual = Time.new			
    	puts "------------------- Costo de Prima de Vehiculos por Cliente -------------------"
    	puts "Nombre y Apellidos : " + @nombre
    	puts "DNI Nro. : " + @dni
    	puts "Telefono : " + @telefono
    	puts "Detalles de Vehiculos : " 
    	@informaciones.each do |vehiculo|
    		antiguedad = anio_actual.year - vehiculo.anio_fabricacion
    		if vehiculo.tipo_vehiculo == "Auto"
    			monto_prima = vehiculo.precio_base / ( 10 * (antiguedad + 1))
    		elsif vehiculo.tipo_vehiculo == "Camioneta"
    			if vehiculo.tipo == "AT"
    				costo = vehiculo.precio_base / ( 10 * (antiguedad + 1))
    				monto_prima = costo + (costo * 0.10)
    			elsif vehiculo.tipo == "NM"
    				monto_prima = vehiculo.precio_base / ( 10 * (antiguedad + 1))
    			end 
    		elsif vehiculo.tipo_vehiculo == "Bus"
    			monto_prima = (vehiculo.precio_base + (vehiculo.asientos * 10)) / (vehiculo.ejes * (antiguedad + 1))
    		end
    		if vehiculo.tipo_vehiculo == "Bus"
    			puts "Vehiculo : " + vehiculo.tipo_vehiculo
				puts "Marca : " + vehiculo.marca
				puts "Modelo : " + vehiculo.modelo
				puts "Año : " + vehiculo.anio_fabricacion.to_s
				if vehiculo.tipo == "AT"
					puts "Transmisión : Automatico "
				elsif vehiculo.tipo == "NM"
					puts "Transmisión : Manual "
				end
				puts "Antiguedad : " + antiguedad.to_s
				puts "Cantidad de Asientos : " + vehiculo.asientos.to_s
				puts "Cantidad de Ejes : " + vehiculo.ejes.to_s
				puts "Precio Base : S/. " + vehiculo.precio_base.to_s
				puts "Monto de la Prima Anual : S/. " + monto_prima.round(2).to_s
				puts "---------------------------------------------------------------------------"
			else
    			puts "Vehiculo : " + vehiculo.tipo_vehiculo
				puts "Marca : " + vehiculo.marca
				puts "Modelo : " + vehiculo.modelo
				puts "Año : " + vehiculo.anio_fabricacion.to_s
				if vehiculo.tipo == "AT"
					puts "Transmisión : Automatico "
				elsif vehiculo.tipo == "NM"
					puts "Transmisión : Manual "
				end
				puts "Antiguedad : " + antiguedad.to_s
				puts "Precio Base : S/. " + vehiculo.precio_base.to_s
				puts "Monto de la Prima Anual : S/. " + monto_prima.round(2).to_s
				puts "---------------------------------------------------------------------------"
			end
    			total = total + monto_prima
    	end 
    		puts "Monto Total por el cliente #{@nombre} : S/. #{total.round(2)}"
    		return total.round(2)
    end

    def reporte_final(suma)
    	totales = 0.0
    	for i in 0...suma.size
    		totales = totales + suma[i]
    	end	
    	puts "La empresa Aseguradora espera recibir Prima de todos los clientes por el monto S/. " + totales.round(2).to_s
    end

end

class Informacion_cliente

	attr_reader :placa, :marca, :modelo, :anio_fabricacion, :precio_base, :tipo, :tipo_vehiculo, :asientos, :ejes
	
	def initialize(placa, marca, modelo, anio_fabricacion, precio_base, tipo, tipo_vehiculo, asientos, ejes)
		@placa = placa
		@marca = marca
		@modelo = modelo
		@anio_fabricacion = anio_fabricacion
		@precio_base = precio_base
		@tipo = tipo
		@tipo_vehiculo = tipo_vehiculo
		@asientos = asientos
		@ejes = ejes
	end
end

suma = []

cliente01 = Don_Seguro.new("Miguel Grau", "10260429", "98989898")
cliente01.agregar_vehiculos("PIN2308", "Hyundai", "Sonata", 2000, 15000.0, "NM", "Auto", 5, 2)
cliente01.agregar_vehiculos("TIN2309", "Toyota", "Hylux", 2012, 26000.0, "AT", "Camioneta", 5, 2)
cliente01.calcular_prima_vehiculo

cliente02 = Don_Seguro.new("Alfonzo Ugarte", "10260430", "97979797")
cliente02.agregar_vehiculos("QIN2208", "Hyundai", "H1", 2010, 45000.0, "NM", "Bus", 30, 4)
cliente02.agregar_vehiculos("WIN2209", "Toyota", "Corolla", 2009, 36000.0, "AT", "Auto", 5, 2)
cliente02.agregar_vehiculos("EIN2208", "Volvo", "Toro", 1999, 65000.0, "NM", "Bus", 40, 5)
cliente02.calcular_prima_vehiculo

suma << cliente01.calcular_prima_vehiculo
suma << cliente02.calcular_prima_vehiculo

cliente02.reporte_final(suma)