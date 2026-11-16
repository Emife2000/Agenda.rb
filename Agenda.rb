# ===== EL MOLDE =====
class Tarea
  attr_accessor :nombre, :estado

  # Toda tarea nueva empieza como "pendiente" sola
  def initialize(nombre, estado = "pendiente")
    @nombre = nombre
    @estado = estado
  end
end

# ===== LAS CAJAS (antes del ciclo) =====
lista = []                                  # aquí se van guardando las tareas
menu = [                                    # las opciones del menú (un array de textos)
  "Agregar nueva tarea",
  "Marcar tarea como completada",
  "Ver tareas pendientes"
]
opcion_salir = menu.length + 1              # si hay 3 opciones, salir es la 4
opcion = -1                                 # valor de relleno para que entre al ciclo

# ===== EL PROGRAMA =====
while opcion != opcion_salir # número contra número ✅
  puts "Elige una opción!!!"
  puts "========================"
  menu.each_with_index do |texto, i|
    puts "#{i + 1}. #{texto}"
  end
  puts "#{opcion_salir}. Salir"             # FUERA del each: sale una sola vez

  opcion = gets.chomp.to_i                  # guardo en la MISMA caja que revisa el while

  case opcion
  when 1
    # Agregar: pregunto el nombre, fabrico la tarea y la meto en la lista
    puts "¿Qué tarea quieres agregar?"
    nombre = gets.chomp
    lista.push(Tarea.new(nombre))
    puts "Tarea agregada ✅"

  when 2
    puts "¿Qué numero de tarea quieres marcar como completada?"
    puts "===================================================="
    lista.each_with_index do |tarea, i|
      puts "#{i + 1}. #{tarea.nombre} - #{tarea.estado}"
    end
    respuesta = gets.chomp.to_i
    tarea = lista[respuesta - 1]
    if tarea.nil? || respuesta < 1 # 2. ¿está vacía? (o sea, ¿ese número no existe?)
      puts "Ese número de tarea no existe ❌"
    else # 3. si sí existe, ahora sí la cambio
      tarea.estado = "Completada"
      puts "Tarea completada ✅"
    end
  when 3
    pendientes = lista.select do |tarea|
      tarea.estado == "pendiente"
    end
    if pendientes.empty?
      puts "No hay tareas pendientes"
    else
      pendientes.each_with_index do |pendiente, i|
        puts "#{i + 1}. #{pendiente.nombre} - #{pendiente.estado}"
      end
    end
  when opcion_salir
    puts "¡Hasta luego! 👋"

  else
    puts "Opción no válida"
  end
end
