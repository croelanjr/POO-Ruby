#encoding:UTF-8
class Cliente
   
    attr_reader :impuesto

	def initialize(nombre,ingreso_anual = 0)
		@nombre = nombre
		@ingreso_anual = ingreso_anual
	    
	end

	def calcular_impuesto
	   @impuesto = Calculadora.calcular_impuesto(@ingreso_anual)
	end
end

class Calculadora
 
    def self.calcular_impuesto(monto)
     (monto-35000)*0.3        	
    end
end

#programa principal (main)

cliente01 = Cliente.new("carlos",45000)
cliente02 = Cliente.new("sonia", 55000)
calculadora01 = Calculadora.new
cliente01.calcular_impuesto
cliente02.calcular_impuesto
puts cliente01.impuesto
puts cliente02.impuesto