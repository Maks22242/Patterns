puts "Введи команду языка Ruby"
comm_Ruby = STDIN.gets.chomp
system "ruby -e \ '#{comm_Ruby}\'"
