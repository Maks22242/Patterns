
#3 Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа.

def sum_dig(x)
	sum = 0
	while(x!=0)
		sum+=x % 10
		x = x/10
	end
	sum
end

def prod_numb(x)
	prod = 1
	for i in 2..x/2
		if(x % i == 0 and sum_dig(x)>sum_dig(i))
			prod*=i
			puts i		
		end
	end
	prod
end
