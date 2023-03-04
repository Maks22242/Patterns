
require 'prime'

def lb1(arr)

	kol = arr.reverse.index(arr.max)
end

def lb2(arr)

	new_arr =arr[arr.index(arr.min)..arr.length-1]+ arr[0..arr.index(arr.min)-1]

end

def lb3(arr)
	
	a = 3
	b = 6
	arr[a+1..b].max
end

def lb4(arr)
	arr = [12,11,32,3,11,12,11,34,12]
	el = (1...arr.size).select{ |x| arr[x] < arr[x-1]}
	return el, el.length
end
	
def lb5(arr)
	
	divisors = []

	arr.each do |number|
	prime_factors = number.prime_division.map(&:first)
	prime_factors.each do |factor|
	divisors << factor unless divisors.include?(factor)
	end
	end
	
	return divisors
end
def get_arr()
	address = ARGV[1]
	file = File.new(address,"r:UTF-8")
	content = file.read
	arr_str = content.split
	arr_int = arr_str.map(&:to_i)
end

def  less()
	arr_int = get_arr()
	puts "Полученный массив:", arr_int
	if(ARGV[0] == "1")
		puts "количество элементов, расположенных после последнего максимального. ", lb1(arr_int)
	end
	if(ARGV[0] == "2")
		puts "элементы, расположенные до минимального, в конце массива.",lb2(arr_int)
	end
	if(ARGV[0] == "3")	
		puts "максимальный из элементов в этом интервале.",lb3(arr_int)
	end
	if(ARGV[0] == "4")
		puts "индексы элементов, которые меньше своего левого соседа, и количество таких чисел.",lb4(arr_int)
	end
	if(ARGV[0] == "5")
		puts "список всех положительных простых делителей элементов списка без повторений.
",lb5(arr_int)
	end

end

less()
