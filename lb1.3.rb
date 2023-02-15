
def min_num_arr(arr)
	min = arr[0]
	for iter in arr
		if(min > iter)
			min = iter
		end
	end
	min
end

def first_pos_el(arr)
	num = -1
	for i in 0..arr.size()		
		if(arr[i] > 0)
			num = i
			break
		end
	end
	if(num == -1)
		"No have pos el"
	else 
		num
	end
end

def get_arr()
	address = ARGV[1]
	file = File.new(address,"r:UTF-8")
	content = file.read
	arr_str = content.split
	arr_int = arr_str.map(&:to_i)
end

def  less()
	puts " 1 - Найти минимальный элемент \n 2 - Найти номер первого положительного элемента"
	arr_int = get_arr()
	puts "Полученный массив:", arr_int
	if(ARGV[0] == "1")
		puts "Минимальный элемент массива: ", min_num_arr(arr_int)
	else
		puts "Номер первого положительного элемента: ",first_pos_el(arr_int)
	end	
end

less()


