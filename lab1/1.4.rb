
require 'prime'

def size_after_max(arr)

	kol = arr.reverse.index(arr.max)
end

def befor_min_in_end(arr)

	new_arr =arr[arr.index(arr.min)..arr.length-1]+ arr[0..arr.index(arr.min)-1]

end

def max_in_bount(arr)
	
	a = 3
	b = 6
	arr[a+1..b].max
end

def index_el_less_left(arr)
	arr = [12,11,32,3,11,12,11,34,12]
	el = (1...arr.size).select{ |x| arr[x] < arr[x-1]}
	return el, el.length
end
	
def prime_el_div(arr)
	
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
		puts "количество элементов, расположенных после последнего максимального. ", size_after_max(arr_int)
	end
	if(ARGV[0] == "2")
		puts "элементы, расположенные до минимального, в конце массива.",befor_min_in_end(arr_int)
	end
	if(ARGV[0] == "3")	
		puts "максимальный из элементов в этом интервале.",max_in_bount(arr_int)
	end
	if(ARGV[0] == "4")
		puts "индексы элементов, которые меньше своего левого соседа, и количество таких чисел.",index_el_less_left(arr_int)
	end
	if(ARGV[0] == "5")
		puts "список всех положительных простых делителей элементов списка без повторений.
",prime_el_div(arr_int)
	end

end

less()
