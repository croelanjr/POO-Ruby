#encoding:UTF-8
=begin
Una empresa de juegos requiere realizar pruebas para una aplicación para celulares 
que va a enviar a producción. La aplicación deberá simular el lanzamiento de dos dados.
La suma de ambos deberá ser evaluada de la siguiente manera

Si el resultado es 7 u 11 en el lanzamiento entonces se pierde.

Si el resultado es 2 o 12 entonces se gana

En cualquier otro caso el resultado será "indefinido"

Desarrollar el programa orientado a objetos que me permita realizar lo solicitado.
=end


class Azar
  attr_accessor :dado01, :dado02
    
    def initialize(dado01,dado02)
    @dado01, @dado02 = dado01, dado02	
    end

    def combinaciones
    	aleatoriodado1 = Random.rand(dado01..dado02)
    	aleatoriodado2 = Random.rand(dado01..dado02)
    	total = aleatoriodado1 + aleatoriodado2
    	if total == 7 or total == 11
    		puts "El dado tirado es : " + total.to_s
    		return "Perdiste"
    	elsif total == 2 or total == 12
    		puts "El dado tirado es : " + total.to_s
    		return "Ganaste"
    	else
    		puts "El dado tirado es : " + total.to_s
    		return "indefinido"
    	end
    end
end  

   lanzamiento01 = Azar.new(1,6)
   puts "El resulado tirado por los dados es : " + lanzamiento01.combinaciones