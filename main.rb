require './lib/regey.rb'
require './lib/token.rb'

puts "Regey"

puts "Enter a string: "
input = gets.chomp

indexes = []
loop do
  puts "Enter index to select, or two to make a range:"
  index_input = gets.chomp

  if index_input == ""
    break
  elsif index_input.split.length == 2
    index_ints = index_input.split.map(&:to_i)

    indexes << (index_ints[0]..index_ints[1])
  elsif index_input.split.length == 1
    indexes << index_input.to_i
  end
end

puts "/#{regey(input, indexes)}/"
