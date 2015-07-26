#encoding:UTF-8
=begin
Una empresa de criptografìa desea un programa que permita descifrar 
un mensaje que dejó el gerente anterior el cual murió de manera abrupta. 

Para ello se tiene una clase encryption-algorithm que es la encargada 
de desencriptar los mensajes. Para ello hay tres posibles algoritmos 
que permiten realizar la operaciòn. 

Murcielago: Se reemplaza cada una de las letras por un número

M U R C I E L A G O
1  2  3 4 5 6 7 8  9  0

Aurelio: Es un procedimiento similar

A U R E L I O 
1  2 3 4 5 6 7

Reversi: La palabra se invierte y se reemplazan las siguientes 
letras por símbolos

N S A E R P O
$ % # ?  & !  +

Por ejemplo perro

perro
orrep
+&&?!

Al sistema se ingresará un texto sin saber cuál es la clave usada 
para encriptarlo. El sistema deberá aplicar los tres algoritmos y 
determinar cuál es el algoritmo que se ha usado para encriptarlo 
originalmente para lo cuál se pide desarrollar el test correspondiente.

Las frases a probar son
40N 6ST0 Y8 8P30B6 67 423S0 
57G34 T43M6N13
#T%?U!%?& #L %? #T%?

Correcto desarrollo de la estructura 
Desarrollo de los métodos para desencriptar 
=end


class Desencriptar

	attr_accessor :frase

	def initialize(frase)
		@frase = frase
		@nuevo_arreglo = []
	end


	def desencriptar_murcielago
		decifrar = @frase.to_s
		for i in 0...decifrar.size
			if decifrar[i] == "1"
				@nuevo_arreglo << "M"
			elsif decifrar[i] == "2"
				@nuevo_arreglo << "U"
			elsif decifrar[i] == "3"
				@nuevo_arreglo << "R"
			elsif decifrar[i] == "4"
				@nuevo_arreglo << "C"
			elsif decifrar[i] == "5"
				@nuevo_arreglo << "I"
			elsif decifrar[i] == "6"
				@nuevo_arreglo << "E"
			elsif decifrar[i] == "7"
				@nuevo_arreglo << "L"
			elsif decifrar[i] == "8"
				@nuevo_arreglo << "A"
			elsif decifrar[i] == "9"
				@nuevo_arreglo << "G"
			elsif decifrar[i] == "0"
				@nuevo_arreglo << "O"
			else 
				@nuevo_arreglo << decifrar[i]	
			end	
		end
		puts @nuevo_arreglo.join("")
	end

	def desencriptar_aurelio
		decifrar = @frase.to_s
		for i in 0...decifrar.size
			if decifrar[i] == "1"
				@nuevo_arreglo << "A"
			elsif decifrar[i] == "2"
				@nuevo_arreglo << "U"
			elsif decifrar[i] == "3"
				@nuevo_arreglo << "R"
			elsif decifrar[i] == "4"
				@nuevo_arreglo << "E"
			elsif decifrar[i] == "5"
				@nuevo_arreglo << "L"
			elsif decifrar[i] == "6"
				@nuevo_arreglo << "I"
			elsif decifrar[i] == "7"
				@nuevo_arreglo << "O"
			else 
				@nuevo_arreglo << decifrar[i]	
			end	
		end
		puts @nuevo_arreglo.join("")
	end

	def desencriptar_invertida
		decifrar = @frase.to_s
		for i in 0...decifrar.size
			if decifrar[i] == "$"
				@nuevo_arreglo << "N"
			elsif decifrar[i] == "%"
				@nuevo_arreglo << "S"
			elsif decifrar[i] == "#"
				@nuevo_arreglo << "A"
			elsif decifrar[i] == "?"
				@nuevo_arreglo << "E"
			elsif decifrar[i] == "&"
				@nuevo_arreglo << "R"
			elsif decifrar[i] == "!"
				@nuevo_arreglo << "P"
			elsif decifrar[i] == "+"
				@nuevo_arreglo << "O"
			else 
				@nuevo_arreglo << decifrar[i]	
			end	
		end
		puts @nuevo_arreglo.join("").reverse
	end
end

frase = "40N 6ST0 Y8 8P30B6 67 423S0"
consulta01 = Desencriptar.new(frase)
consulta01.desencriptar_murcielago

frase = "57G34 T43M6N13"
consulta02 = Desencriptar.new(frase)
consulta02.desencriptar_aurelio

frase = "#T%?U!%?& #L %? #T%?"
consulta03 = Desencriptar.new(frase)
consulta03.desencriptar_invertida
