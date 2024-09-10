def simpleArraySum(ar)
  total = 0
  ar.each do |num|
    total += num
  end
  total
end

ar_count = gets.to_i
ar = gets.split.map(&:to_i)

puts simpleArraySum(ar)
