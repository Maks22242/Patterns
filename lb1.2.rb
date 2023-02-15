name = ARGV[0]
puts 'Привет', name, 'Какой твой любимый язык программирования?'
lang = STDIN.gets.chomp
case lang
	when "Ruby"
		puts "Подлиза!"
	when "C++"
		puts "А почему не Ryby"
	when "C#"
		puts "Прикольно"
	else
		puts "А скоро будет Ruby"
end
