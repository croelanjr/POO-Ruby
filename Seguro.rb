class Cliente
  
  attr_accessor :nombre, :dni, :edad, :seguros
  
  def initialize(nombre, dni, edad)
  	@nombre = nombre
  	@dni = dni
  	@edad = edad
  	@seguros = Array.new
  end


  def agregar_cuenta(tipo, monto)
    @seguros << crear_seguro(tipo, monto)
  end

  def cantidad_seguro
  	contador = 0
  	seguros.each do |segu|
  		contador = contador + 1
  	end
 	contador
  end

  def listado_seguro_por_cliente
  	tipo_letra = " "
  	@seguros.each do |segu|
  		if segu.tipo != ""
  		tipo_letra = segu.tipo
  		puts "Seguro de #{tipo_letra.to_s} por el monto anual de S/. #{segu.monto.round(2)}"
  		end
   	end
   	return "----------------------------------------------------------------------"
  end

  def descuento_por_cantidad_seguro
  		cantidad_de_seguro = cantidad_seguro
  		if 3 >= cantidad_de_seguro or cantidad_de_seguro <= 5
  			descuento = 0.10
  		elsif 6 >= cantidad_de_seguro or cantidad_de_seguro <= 9
  			descuento = 0.15
  		elsif 9 < cantidad_de_seguro
  			descuento = 0.20
  		end
  		descuento
  end

  def calcular_descuento_seguro
  	  	total = 0.0
  	  	suma_monto = 0.0
  		descuento_aplicado = descuento_por_cantidad_seguro
  		@seguros.each do |segu|
  			suma_monto = suma_monto + segu.monto
  		end
  		total = (suma_monto - (suma_monto * descuento_aplicado)) / 12 
  end

  def reporte
  	puts "--------------- Consulta de un cliente por Diversos Seguros -----------------"
  	puts "Nombre y Apellidos : #{nombre}"
  	puts "DNI Nro. : #{dni}"
  	puts "Edad : #{edad}"
  	puts "-----------------------------------------------------------------------------"
  	puts "Este cliente cuenta con #{cantidad_seguro.to_s} seguros de diferentes de los siguientes :" 	
  	listado_seguro_por_cliente
  	puts "-----------------------------------------------------------------------------"
  	puts "El monto mensual con el descuento de #{descuento_por_cantidad_seguro*100}% es S/. #{calcular_descuento_seguro.round(2)}"
  	puts "-----------------------------------------------------------------------------"
  end

  private

   def crear_seguro(tipo, monto)
    Seguro.new(tipo, monto)
   end

end

class Seguro

  attr_accessor :tipo, :monto
  
  def initialize(tipo, monto)
  	@tipo = tipo
  	@monto = monto
  end

end

#Puedes descomentar el signo # las demas lineas del cliente01 para que pueda
#los resultados por los descuentos obtenidos

cliente01 = Cliente.new("Carlos Maldonado", "09384765", 38)
cliente01.agregar_cuenta("Vida", 2500)
cliente01.agregar_cuenta("Accidental", 2100)
cliente01.agregar_cuenta("Oncologico", 3400)
#cliente01.agregar_cuenta("Soat", 1400)
#cliente01.agregar_cuenta("Familiar", 2000)
#cliente01.agregar_cuenta("Cancer", 1000)
#cliente01.agregar_cuenta("Viajero", 3000)
#cliente01.agregar_cuenta("Maternal", 3900)
#cliente01.agregar_cuenta("Escolar", 2120)
#cliente01.agregar_cuenta("Robo", 3210)
puts cliente01.reporte


#Puedes descomentar el signo # a todos, los resultados funcionan 
#cliente02 = Cliente.new("Miguel Grau", "10101010", 23)
#cliente02.agregar_cuenta("Vida", 2700)
#cliente02.agregar_cuenta("Accidental", 2100)
#cliente02.agregar_cuenta("Oncologico", 3470)
#cliente01.agregar_cuenta("Soat", 1400)
#cliente01.agregar_cuenta("Familiar", 2000)
#cliente01.agregar_cuenta("Cancer", 1000)
#cliente01.agregar_cuenta("Viajero", 3000)
#cliente01.agregar_cuenta("Maternal", 3900)
#cliente01.agregar_cuenta("Escolar", 2120)
#cliente01.agregar_cuenta("Robo", 3210)
#puts cliente02.reporte