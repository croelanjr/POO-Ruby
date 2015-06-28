class Alumno

	attr_accessor :codigo, :nombre, :apellido, :pc01, :pc02, :pc03, :parcial, :final

 def initialize(codigo, nombre, apellido, pc01, pc02, pc03, parcial, final)
 	@codigo = codigo
 	@nombre = nombre
 	@apellido = apellido
 	@pc01 = pc01
 	@pc02 = pc02
 	@pc03 = pc03
 	@parcial = parcial
 	@final = final
 end

 def promedio_final
 	((pc01 + pc02 + pc03) / 3) * 0.2 + parcial * 0.3 + final * 0.5
 end
end

alumno01 = Alumno.new("001", "Croelan", "Grandez", 12, 12, 12, 11, 10)
alumno02 = Alumno.new("002", "Cristian", "Gutierrez", 13, 12, 14, 11, 14)

puts alumno01.promedio_final
puts alumno02.promedio_final
