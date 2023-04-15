require_relative 'Student'
require_relative 'Student_short'

stud2 = Student.iniz("Петренко, Роман, Николаевич, +79261234567 ,makcu@mail.ru,https://t.me/lrmanga/2211")
puts stud2.to_s

stud_short = Student_short.new(stud2)
puts stud_short

#Чтение массива студентов из файла
def read_from_txt(addres)
  raise ArgumentError, "Адресс некоректен" unless File.exist?(addres)
  file = File.open(addres){|file| file.read}
  students = file.split("\n").map{|x| x = Student.iniz(x)}

end



def wrire_to_txt(addres, arr_students)
  res = ""
  arr_students.each do |student|
    res += student.to_s
  end
  File.write(addres,res)
end

students = read_from_txt("./students_file.txt")
students.map{|x| puts x.get_info}
wrire_to_txt("./output.txt",students)
