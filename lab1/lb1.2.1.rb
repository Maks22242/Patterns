#1 Найти сумму простых делителей числа.
def simple_num(x)
	num_div	= true
	for iter in 2..x/2
		if( x % iter == 0)
			num_div = false			
		end
	end
	num_div

end

def sum_sim_div(x)
	sum_div = 0
	for iter in 2..x/2
		if( x % iter == 0 and simple_num(i))
			sum_div += iter	
		end
	end
	sum_div
end



