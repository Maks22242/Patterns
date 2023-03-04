
#1.49. Для введенного списка положительных чисел построить список всех положительных простых делителей элементов списка без повторений.

require 'prime'

numbers = [10, 21, 32, 47, 53, 64, 71, 89, 90, 101]
divisors = []

numbers.each do |number|
prime_factors = number.prime_division.map(&:first)
prime_factors.each do |factor|
divisors << factor unless divisors.include?(factor)
end
end

puts divisors
