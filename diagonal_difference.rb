def diagonalDifference(arr)
  n = arr.size
  primary_diagonal_sum = 0
  secondary_diagonal_sum = 0
  
  (0...n).each do |i|
    primary_diagonal_sum += arr[i][i]
    secondary_diagonal_sum += arr[i][n - i - 1]
  end
  
  (primary_diagonal_sum - secondary_diagonal_sum).abs
end

n = gets.to_i

matrix = Array.new(n) do
  gets.split.map(&:to_i)
end

puts diagonalDifference(matrix)
