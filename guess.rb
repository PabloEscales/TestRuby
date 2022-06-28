def guess
  numero = gets.chomp.to_i
  while numero >= 11
    puts "solo numeros del 1 al 10"
    numero = gets.chomp.to_i
  end
  return "  TU NUMERO ES: #{numero}  "
end
