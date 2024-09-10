def reverse_string(str)
  reverse_str = ""
  (str.length - 1).downto(0) do |i|
    reverse_str += str[i]
  end
  reverse_str
end

def reverse_string_use_func(str)
  str.reverse
end 

input = gets.chomp

reversed = reverse_string_use_func(input)

puts reversed
