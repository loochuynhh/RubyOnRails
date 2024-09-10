def plusMinus(arr)
  n = arr.size
  positive_count = 0
  negative_count = 0
  zero_count = 0

  arr.each do |num|
    if num > 0
      positive_count += 1
    elsif num < 0
      negative_count += 1
    else
      zero_count += 1
    end
  end

  puts format('%.6f', positive_count.to_f / n)
  puts format('%.6f', negative_count.to_f / n)
  puts format('%.6f', zero_count.to_f / n)
end

n = gets.to_i

arr = gets.split.map(&:to_i)

plusMinus(arr)
