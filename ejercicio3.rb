def palabras_archivo()
  file = File.open('peliculas.txt', 'r')
  contenido = file.readlines
  file.close

  palabra = 0
  contenido.each do |x|
    palabras = x.split(' ').each do |y|
      palabra += 1
    end
  end

  palabra
end

def palabra_archivo?(word)
  file = File.open('peliculas.txt', 'r')
  contenido = file.readlines
  file.close

  palabra = 0
  contenido.each do |x|
    palabras = x.split(/\W+/).each do |y|
      if word.downcase == y.downcase
        palabra += 1
      end
    end
  end

  palabra
end

puts palabras_archivo
puts palabra_archivo?('la')