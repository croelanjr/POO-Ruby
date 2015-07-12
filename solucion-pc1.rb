
=begin 

Defina una clase denominada Cliente con las propiedades nombre y dni, 
considere que un cliente puede poseer una o más cuentas de ahorro.
Defina una clase denominada Cuenta de un cliente de un banco, con las 
propiedades código y saldo.
Realizar un programa tal que se inicialice los datos de un cliente dado 
y luego se pueda actualizar su saldo con un monto que se le pasará como 
parámetro.
Pruebe con los siguientes datos: Código=2324325, nombre=”Luis Perez”, 
DNI=”09384567” y saldo=200 soles
Incremente el saldo en una de sus cuentas con 300 soles
Muestre los datos de cliente y los saldos de sus cuentas.
=end

class Cliente
  attr_accessor :nombre, :dni, :cuentas
  
  def initialize(nombre, dni)
  	@nombre, @dni = nombre, dni
  	@cuentas = Array.new
  end


  def agregar_cuenta(codigo, saldo)
    @cuentas << crear_cuenta(codigo, saldo)
  end

  def reporte
  	total = 0
    resultado = " "
    resultado += "Nombre: #{nombre} "
    resultado += "DNI: #{dni}"
    cuentas.each do |cuenta|
      resultado += "\n código #{cuenta.codigo}"
      resultado += " saldo #{cuenta.saldo}"
      total += cuenta.saldo
    end
    resultado += "\n Su saldo total es: #{total}"
    return resultado
  end

  def depositar(codigo, monto)
    cuenta = buscar_cuenta(codigo)
    cuenta.depositar(monto)
  end
  private

   def crear_cuenta(codigo, saldo)
    Cuenta.new(codigo, saldo)
  end

  def buscar_cuenta(codigo)
    cuentas.each do |cuenta|
      return cuenta if cuenta.codigo == codigo
    end 
  end


end

class Cuenta
  attr_accessor :codigo, :saldo
  def initialize(codigo, saldo)
  	@codigo, @saldo = codigo, saldo
  end

  def depositar(monto)
  	@saldo += monto
  end
end

cliente01 = Cliente.new("Carlos", "09384765")
cliente01.agregar_cuenta("001", 500)
cliente01.agregar_cuenta("002", 1500)
cliente01.depositar("001", 135)
puts cliente01.reporte