# 1.13 Дан целочисленный массив. Необходимо разместить элементы, расположенные до минимального, в конце массива.

arr = [12,11,32,3,12,34,11,12]
new_arr =arr[arr.index(arr.min)..arr.length-1]+ arr[0..arr.index(arr.min)-1]
puts new_arr