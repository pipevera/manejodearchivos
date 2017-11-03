def agregar_texto(x, y)
  file = File.open('index.html', 'a')
  file.puts "<p>#{x}</p>"
  file.puts "<p>#{y}</p>"
  file.close
end

def agregar_lista(x, y, arr)
  file = File.open('index.html', 'a')
  file.puts "<p>#{x}</p>"
  file.puts "<p>#{y}</p>"
  file.puts '<ul>'
  arr.each do |x|
    file.puts " <li>#{x}</li>"
  end
  file.puts '</ul>'
  file.close
end

def agregar_color(x, y, arr, color)
  file = File.open('index.html', 'a')
  file.puts "<p style= background-color:#{color}>#{x}</p>"
  file.puts "<p style= background-color:#{color}>#{y}</p>"
  file.puts '<ul>'
  arr.each do |x|
    file.puts " <li>#{x}</li>"
  end
  file.puts '</ul>'
  file.close
end

a = ['hola', 'mundo', 'chao', 'mundo']

agregar_texto('hola', 'mundo')
agregar_lista('hola', 'mundo', a)
agregar_color('hola', 'mundo', a, 'blue')