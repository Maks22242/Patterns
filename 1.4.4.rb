#1.37 Дан целочисленный массив. Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел.

arr = [12,11,32,3,11,12,11,34,12]
el = (1...arr.size).select{ |x| arr[x] < arr[x-1]}
puts el, el.length