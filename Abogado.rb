#encoding:UTF-8
=begin
Un estudio de abogados desea iniciar un servicio dirigido al sector informático. Debido a que las leyes son complejas en general quieren desarrollar una app que permita presupuestar e inscribir a los clientes en el sistema de forma simple y determinar los casos a realizar. 

Los abogados tiene los siguientes datos: Nombre, Apellido, Monto mínimo por caso, especialidad (laboral, civil, penal). 

Los clientes pueden ser personas naturales o personas jurídicas. 
En el caso de las personas naturales se consigna el nombre, apellido, 
DNI, telefono. En el caso de las personas jurídicas se requieren los 
siguientes datos: razón social, RUC, teléfono, nombre del representante. 
Se debe tomar en cuenta que el precio se calcula de forma diferente 
para las personas naturales 

El factor por especialidad es el siguiente:
laboral = 2.5
civil = 3.0
penal = 4.5

En el caso de las personas naturales se determina lo siguiente:
costo = monto mínimo por caso * 10 + (factor por especialidad * 500)

En el caso de las personas jurídicas se determina lo siguiente:
costo = monto mínimo por caso  * factor de especialidad + 1500

Se debe tener en cuenta que el abogado puede tener varios casos
Se pide:

Definir la estrucutura de clases y sus relaciones 
Desarrollar el método que permita calcular lo que se debe pagar 
por una persona natural a un abogado
Desarrollar el método que permita calcular lo que se debe pagar 
por una persona jurídica a un abogado
Desarrollar un método que permita  determinar cuánto se le debe 
pagar a un abogado por todos sus casos 
=end

class Abogado
  
  attr_accessor :buscar, :arreglo, :nombre, :documento, :telefono, :especialidad, :monto, :tipo, :persona, :representante

  def initialize(buscar, arreglo, persona)
    @arreglo = arreglo
    @buscar = buscar
    @persona = persona 
  end
  
  def factores(especialidad)
  	factor = 0
  	if especialidad == "laboral"
  		factor = 2.5
  	elsif especialidad == "civil"
  		factor = 3.0
  	elsif especialidad == "penal"
  		factor = 4.5
  	end
  	return factor
  end

  def calcular_costo_natural
  	costo = 0.0
  	@arreglo.each do |mm|
  		if mm.tipo == @persona and mm.documento == @buscar
  			costo_factor = factores(mm.especialidad)
  			costo = mm.monto * 10 + (costo_factor * 500)
  			puts "--------------- Costo por especialidad por Persona Natural ----------------"
  			puts "Cliente : " + mm.nombre
  			puts "DNI Nro. : " + mm.documento
  			puts "Caso de Jucio : " + mm.especialidad
  			puts "Monto Solicitado : S/. " + mm.monto.to_s
  			puts "Monto a Pagar Abogado : S/. " + costo.to_s
  			puts "---------------------------------------------------------------------------"
  		end 
  	end
  end


  def calcular_costo_juridica
  	costo = 0.0
  	@arreglo.each do |mm|
  		if mm.tipo == @persona and mm.documento == @buscar
  			costo_factor = factores(mm.especialidad)
  			costo = mm.monto * costo_factor + 1500
  			puts "--------------- Costo por especialidad por Persona Juridica ----------------"
  			puts "Cliente : " + mm.nombre
  			puts "RUC Nro. : " + mm.documento
  			puts "Representante : " + mm.representante
  			puts "Caso de Jucio : " + mm.especialidad
  			puts "Monto Solicitado : S/. " + mm.monto.to_s
  			puts "Monto a Pagar Abogado : S/. " + costo.to_s
  			puts "---------------------------------------------------------------------------"
  		end 
  	end
  end

 def calcular_costo_total
  	costo = 0.0
  	total = 0.0
  	@arreglo.each do |mm|
  			costo_factor = factores(mm.especialidad)
  			if mm.tipo == "N"
  				costo = mm.monto * 10 + (costo_factor * 500)
  			elsif mm.tipo == "J"
  				costo = mm.monto * costo_factor + 1500
	  		end
  		total = total + costo
  	end
  			puts "--------------------------- Costos Totales --------------------------------"
  			puts " Monto Total a pagar al Abogado : S/. " + total.to_s
  			puts "---------------------------------------------------------------------------" 
  end

end

class Cliente

  attr_accessor :nombre, :documento, :telefono, :especialidad, :monto, :representante, :tipo
  
  def initialize(nombre, documento, telefono, especialidad, monto, representante, tipo)
    @nombre = nombre
    @documento = documento
    @telefono = telefono
    @especialidad = especialidad
    @monto = monto
    @tipo = tipo
    @representante = representante
  end
end


arreglo = Array.new

cliente01 = Cliente.new("Carlos Maldonado", "09384765", "98989898", "laboral", 1000.00, "", "N")
cliente02 = Cliente.new("Rosa Oliver", "10260429", "97979797", "civil", 1500.00, "", "N")
cliente03 = Cliente.new("Yndira Leon", "10260431", "96969696", "penal", 1900.00, "", "N")
cliente04 = Cliente.new("Empresa transporte S.A.", "20102604291", "95959595", "laboral", 1800.00, "Oscar Leon", "J")
cliente05 = Cliente.new("Empresa Industrial S.A.", "20102604332", "94949494", "civil", 3400.00, "Tu abuela", "J")
cliente06 = Cliente.new("Empresa Sexo S.A.", "20102604344", "94949494", "penal", 2300.00, "Perricholi Tupac", "J")

arreglo << cliente01
arreglo << cliente02
arreglo << cliente03
arreglo << cliente04
arreglo << cliente05
arreglo << cliente06

buscar = "10260429"
persona = "N"
consulta01 = Abogado.new(buscar,arreglo,persona)
consulta01.calcular_costo_natural

buscar = "20102604332"
persona = "J"
consulta02 = Abogado.new(buscar,arreglo,persona)
consulta02.calcular_costo_juridica

consulta02.calcular_costo_total