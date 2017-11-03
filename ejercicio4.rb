file = File.open('productos.txt', 'r')
content = file.readlines
file.close

eleccion = 0

while eleccion != 6

  puts 'seleccione una opcion'
  puts '1) existencias'
  puts '2) mostrar stock de un producto'
  puts '3) mostrar productos no registrados'
  puts '4) mostrar productos con menor stock al ingresado'
  puts '5) ingresar nuevo producto'
  puts '6) salir'

  eleccion = gets.chomp.to_i

  if eleccion <= 0 || eleccion > 6
    puts 'eleccion invalida'
    puts 'ingrese un valor dentro del rango establecido'
    puts
  elsif eleccion == 1
    eleccion1 = 0

    while eleccion1 != 'd'
      puts 'a) mostrar existencias por producto'
      puts 'b) mostrar existencia total por tienda'
      puts 'c) mostrar existencia total de todas las tiendas'
      puts 'd) volver al menu principal'

      eleccion1 = gets.chomp

      if eleccion1 < 'a' || eleccion1 > 'd'
        puts 'eleccion invalida'
        puts 'ingrese un valor dentro del rango establecido'
        puts
      elsif eleccion1 == 'a'
        content.each do |x|
          a = x.split(', ')
          puts "el producto #{a[0]} tiene un stock total de #{a[1].to_i + a[2].to_i + a[3].to_i}"
        end
        puts
      elsif eleccion1 == 'b'
        content.each do |x|
          puts x
        end
      elsif eleccion1 == 'c'
        tienda1 = 0
        tienda2 = 0
        tienda3 = 0

        content.each do |x|
          a = x.split(', ')
          tienda1 += a[1].to_i
          tienda2 += a[2].to_i
          tienda3 += a[3].to_i
        end

        puts "el stock total de la 1 es #{tienda1}"
        puts "el stock total de la 2 es #{tienda2}"
        puts "el stock total de la 3 es #{tienda3}"
        puts
      end
    end
  elsif eleccion == 2
    puts 'ingrese el producto a buscar'
    eleccion2 = gets.chomp

    content.each do |x|
      a = x.split(', ')
      if a[0].downcase == eleccion2.downcase
        suma = a[1].to_i + a[2].to_i + a[3].to_i
      end
      puts suma
    end
  elsif eleccion == 3
    content.each do |x|
      a = x.split(', ')
      a.each_with_index do |x, y|
        if x.chomp == 'NR'
          puts "el producto #{a[0]} no se encuentra registrado en la bodega #{y}"
        end
      end
    end
  elsif eleccion == 4
    puts 'ingrese un valor'
    eleccion4 = gets.chomp.to_i

    content.each do |x|
      a = x.split(', ')
      suma = a[1].to_i + a[2].to_i + a[3].to_i

      if suma < eleccion4
        puts "el producto #{a[0]} tiene una existencia total de #{suma}"
      end
    end
  elsif eleccion == 5
    puts 'ingrese el nombre del producto'
    nuevo = gets.chomp
    puts 'ingrese stock 1'
    stock1 = gets.chomp
    puts 'ingrese stock 2'
    stock2 = gets.chomp
    puts 'ingrese stock 3'
    stock3 = gets.chomp

    file = File.open('productos.txt', 'a')
    file.puts "#{nuevo}, #{stock1}, #{stock2}, #{stock3}"
    file.close
  end
end