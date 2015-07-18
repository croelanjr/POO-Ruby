=begin
Pregunta 2
Un ingeniero de sistemas acaba de constituir una empresa de 
desarrollo de software y se encuentra en el proceso de selección 
del personal que trabajará con él.

Para tener un mejor control tanto de los puestos que debe cubrir 
como de los postulantes que entregan su hoja de vida, ha decidido 
realizar un programa que le ayude en este proceso.

De acuerdo a los productos que tiene en mente desarrollar, 
y al organigrama que ha elaborado, ha podido definir el perfil 
de las personas que necesita.

Para ello lo primero que se tendrá que hacer es registrar los 
datos de cada puesto vacante:

* Área
* Cargo
* Funciones
* Peso de los aspectos a evaluar (teniendo en cuenta que el total debe sumar 100%)
o Experiencia
o Estudios
o Personalidad
o Idiomas
o Otros (por ejemplo sueldo o condición laboral)

Luego por cada puesto se requiere tener un control de los postulantes que se han evaluado. Para ello se registrará:
* Nombre del postulante
* Teléfono
* E-mail
* Salario estimado
* Puntaje obtenido en las evaluaciones (en un rango de 1 a 4)
o Experiencia
o Estudios
o Personalidad
o Idiomas
o Otros
* Observaciones
Finalmente se quiere que el programa determine:

Por cada puesto:
* El candidato seleccionado de acuerdo al nivel obtenido 
(según los puntajes y peso de cada criterio evaluado)
* El sueldo promedio que se pagaría según los candidatos 
a ese puesto.

En general:
* Número total de postulantes
* Promedio de postulantes por puesto
* El sueldo promedio que se pagaría según los seleccionados por 
puesto.
* El total de dinero que se necesitaría para pagar a los empleados 
seleccionados por cada puesto.

Defina las instancias necesarias para realizar la prueba del programa.	
=end

class Puntaje

	attr_accessor :puntajes

	def initialize(nombre, telefono, email, salario, experiencia, estudio, personalidad, idioma, otro)
		@puntajes = experiencia + estudio + personalidad + idioma + otro
		@salario = salario
	end

	def costo_total
		total = puntajes 
	end
end

class Programacion < Puntaje
	attr_accessor :salario, :nombre
	@programa_arreglo = Array.new

	def initialize(nombre, telefono, email, salario, experiencia, estudio, personalidad, idioma, otro)
		super(nombre, telefono, email, salario, experiencia, estudio, personalidad, idioma, otro)
		@nombre = nombre
		@salario = salario
	end
end

class Base_Datos < Puntaje
	attr_accessor :salario, :nombre

	def initialize(nombre, telefono, email, salario, experiencia, estudio, personalidad, idioma, otro)
		super(nombre, telefono, email, salario, experiencia, estudio, personalidad, idioma, otro)
		@nombre = nombre 
		@salario = salario
	end
end

class Empleado

	attr_accessor :postulantes

	@postulantes = Array.new
	@postulante_programacion = []

	def self.crear_postulante
		postulante01 = Programacion.new("Miguel Grau", "98989898", "mgrau@gmail.com", 2500.00, 2,4,2,3,3)
		postulante02 = Programacion.new("Alfonso Ugarte", "97979797", "augarte@gmail.com", 2550.00, 4,4,2,3,3)
		postulante03 = Programacion.new("Tupac Amaru", "46464646", "tamaru@gmail.com", 2800.00, 4,4,4,4,4)
		postulante04 = Programacion.new("Alan Garcia", "92929292", "agarcia@gmail.com", 2400.00, 2,4,2,4,4)
		postulante05 = Base_Datos.new("Mama Ocllo", "89898989", "mocllo@gmail.com", 2600.00, 2,4,2,3,3)
		postulante06 = Base_Datos.new("Athahualpa Llama", "67676767", "allama@gmail.com", 2880.00, 1,4,2,3,3)
		postulante07 = Base_Datos.new("Francisco Bolognesi", "34343434", "fbolognesi@gmail.com", 2990.00, 4,4,4,4,4)
		postulante08 = Base_Datos.new("Jose Quiñores", "12121212", "jquiñones@gmail.com", 2333.00, 2,4,2,4,4)

		@postulantes << postulante01
		@postulantes << postulante02
		@postulantes << postulante03
		@postulantes << postulante04
		@postulantes << postulante05
		@postulantes << postulante06
		@postulantes << postulante07
		@postulantes << postulante08
	end

	def self.cantidad_postulante
		contador = 0
		for i in 0...@postulantes.size
			contador = contador + 1
		end
		contador
	end

	def self.puntaje_obtenido
		puntos = 0
		@postulantes.each do |postula|
			puntos = postula.costo_total
			puts "El postulante #{postula.nombre} tiene puntaje obtenido de #{puntos} puntos"
		end
	end

	def self.ganador
		puntos = 0
		nombre_ganador = " "
		@postulantes.each do |postula|
			puntos = postula.costo_total
			if puntos == 20 
				nombre_ganador = postula.nombre
				puts nombre_ganador
			end
		end
	end

	def self.ganadores
		arreglo = []
		puntos = 0
		name = " "
		@postulantes.each do |postula|
			punto = postula.costo_total
			name = postula.nombre
			arreglo.push([name,punto])
		end
		#print arreglo
		
				

		pais = arreglo.collect {|x,y| x}
        muestra = arreglo.collect {|x,y| y}
   	    poblaciones = 0
   	  	indice = 0
   	  	for i in 0...muestra.size
   	  		if muestra[i] == 20
   	  			poblaciones = muestra[i]
   	  			indice = i	
   	  		puts pais[indice]
   	  		end
   	  		#puts pais[indice]
   	  	end
   	#puts pais[indice]

	end


	def self.resultado
		crear_postulante
		puts "-------------- Resultado ------------"
		puts "Hay #{cantidad_postulante} Postulantes en diferentes Areas"
		puts "-------------------------------------"
		puts "---------- Listado de Puntajes Obtenidos --------"
		puntaje_obtenido
		puts "-------------------------------------------------"
		puts "----------- El ganador de los puntajes obtenidos por los 20 puntos ------------"
		ganador
		puts "-----------------------------------"
		ganadores
	end
end

Empleado.resultado