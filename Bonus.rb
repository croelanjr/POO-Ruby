#encoding:UTF-8
=begin
Una empresa desea realizar el control transaccional de sus clientes 
mediante un sistema de puntos. En cada transacción del cliente se 
indica una descripción, una fecha (en texto 12 / 01/ 2014) y un monto. 
El sistema determina al cliente con su nombre y DNI.

Por cada transacción realizada el cliente acumula puntos según el 
siguiente criterio. Por cada 7 soles se acumula 1 punto sin considerar 
decimales. 

Se le pide desarrollar las siguientes funcionalidades:

La correcta estructura de las clases involucradas  

Yo como usuario del sistema debo poder mostrar puntos de un cliente. 
Yo como usuario del sistema debo poder calcular correctamente la cantidad 
de transacciones de un cliente.
Yo como usuario del sistema debo poder observar la cantidad de puntos 
de una transacción hecha por un cliente.
Yo como usuario del sistema debo poder mostrar la cantidad de puntos 
totales de todos los clientes dentro del sistema.
=end

class Bonus
  
  attr_accessor :buscar, :arreglo, :monto, :nombre, :dni, :fecha_nacimiento, :puntos

  def initialize(buscar, arreglo, monto)
    @arreglo = arreglo
    @buscar = buscar
    @monto = monto 
  end
  
  def cantidad_cliente
    contador = 0
    @arreglo.each do |mm|
      contador = contador + 1 
    end
    puts "La cantidad de Cliente es : " + contador.to_s
  end

  def buscar_cliente
    @arreglo.each do |mm|
      if mm.dni == @buscar
        puts "-------------------- Consulta por Cliente ------------------"
        puts "Cliente : " + mm.nombre 
        puts "DNI : " + mm.dni
        puts "Fecha de Nacimiento : " + mm.fecha_nacimiento
        puts "Puntos : " + mm.puntos.to_s
        puts "------------------------------------------------------------"
      end
    end
  end

  def calcular_transacciones
    total = 0
    adiciona_punto = 0
    @arreglo.each do |mm|
      if mm.dni == @buscar
        adiciona_punto = (@monto / 7.0).round(0)
        total = mm.puntos + adiciona_punto
        puts "------------ Calculo de Transaciones por Cliente ------------------"
        puts "Cliente : " + mm.nombre 
        puts "DNI : " + mm.dni
        puts "Fecha de Nacimiento : " + mm.fecha_nacimiento
        puts "Monto Comprado : S/. " + @monto.to_s
        puts "Puntos Anteriores: " + mm.puntos.to_s
        puts "Puntos por Adicionar: " + adiciona_punto.to_s
        puts "Puntos Totales Realizados : " + total.to_s
        puts "------------------------------------------------------------"
      end
    end
  end

  def observar_transacciones
    total = 0
    adiciona_punto = 0
    @arreglo.each do |mm|
      if mm.dni == @buscar
        adiciona_punto = (@monto / 7.0).round(0)
        total = mm.puntos + adiciona_punto
        puts "-------------------- Transaciones por Cliente --------------"
        puts "Cliente : " + mm.nombre 
        puts "DNI : " + mm.dni
        puts "Fecha de Nacimiento : " + mm.fecha_nacimiento
        puts "Puntos Totales : " + total.to_s
        puts "------------------------------------------------------------"
      end
    end
  end

  def cantidad_puntos_todos_clientes
    total = 0
    puts "-------------------- Listado de Puntos de Todos los Clientes ------------------"
    puts "Cliente\t\t\t\t\tDNI\t\tFecha de Nacimiento\t\tPuntos" 
    @arreglo.each do |mm|
      puts mm.nombre + "\t\t\t\t" + mm.dni + "\t\t" + mm.fecha_nacimiento + "\t\t" + mm.puntos.to_s
      total = total + mm.puntos
    end
    puts "-------------------------------------------------------------------------------"
    puts " Totales de los Puntos " + total.to_s
  end

end

class Cliente

  attr_accessor :nombre, :dni, :fecha_nacimiento, :puntos
  
  def initialize(nombre, dni, fecha_nacimiento, puntos)
    @nombre = nombre
    @dni = dni
    @fecha_nacimiento = fecha_nacimiento
    @puntos = puntos
  end
end

arreglo = Array.new

cliente01 = Cliente.new("Carlos Maldonado", "09384765", "20-01-2015", 123)
cliente02 = Cliente.new("Rosa Oliver", "10260430", "29-01-2015", 163)
cliente03 = Cliente.new("Yndira Leon", "10260431", "30-01-2015", 173)
cliente04 = Cliente.new("Francisco Toro", "10260429", "29-01-2015", 180)
cliente05 = Cliente.new("Miguel Grau", "10260433", "29-01-2015", 193)
cliente06 = Cliente.new("Alfonso Ugarte", "10260434", "29-01-2015", 23)
cliente07 = Cliente.new("Simon Bolivar", "10260435", "29-01-2015", 223)

arreglo << cliente01
arreglo << cliente02
arreglo << cliente03
arreglo << cliente04
arreglo << cliente05
arreglo << cliente06
arreglo << cliente07

buscar = "10260429"
monto = 1234.00
consulta01 = Bonus.new(buscar,arreglo,monto)
consulta01.cantidad_cliente
consulta01.buscar_cliente
consulta01.calcular_transacciones
consulta01.observar_transacciones
consulta01.cantidad_puntos_todos_clientes
