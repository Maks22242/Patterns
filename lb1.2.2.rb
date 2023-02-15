#2 Найти количество нечетных цифр числа, больших 3
def num_odd_dig(x)
	size = 0
	while(x!=0)
		if(x % 10 % 2 == 1 and x % 10 > 3)
			size +=1
		end
		x = x/10
	end
	size
end

