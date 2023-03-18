class Student 
	attr_reader :id, :name, :lastName, :midleName, :phone, :tme, :mail, :git
	
	def initialize(lastName: ,name: ,midleName:, id: nil, phone: nil, mail: nil, git: nil)
		
		if phone != nil then
			check_phone(phone)
		end
		self.id =id
		self.lastName = lastName
		self.name = name
		self.midleName = midleName
		self.phone = phone
		self.tme = tme
		self.mail = mail
		self.git = git
	end	
	
	def to_s
		"id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @tme #{@tme}, mail #{@mail}, git: #{@git}\n"
	end
	
	def check_phone(phone)
		
		unless phone =~ /\A\+?\d{11}\z/ then
			raise ArgumentError, "Задан неверный формат номера"
		end
	end
	private 
	attr_writer :id, :name, :lastName, :midleName, :phone, :tme, :mail, :git
end

stud = Student.new(lastName: "Петренко",name: "Роман",midleName: "Николаевич",phone: "+71234567890")
print stud.to_s
