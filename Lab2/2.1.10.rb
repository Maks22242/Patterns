class Student 
	attr_reader :id, :name, :lastName, :midleName, :phone, :tme, :mail, :git
	
	def initialize(lastName: ,name: ,midleName:, id: nil, phone: nil, mail: nil, git: nil)
		
		raise ArgumentError, "Один из обязательных параметров задан неврно" unless name && lastName && midleName
		
		if phone != nil then
			validate_phone(phone)
		end
		if mail != nil then
			validate_mail(mail)
		end
		if git != nil then
			validate_mail(git)
		end
		self.id =id 
		self.lastName = lastName
		self.name = name
		self.midleName = midleName
		self.phone = phone
		self.mail = mail
		self.tme = tme
		self.git = git
	end	
	
	
	
	def to_s
		"id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @tme #{@tme}, mail #{@mail}, git: #{@git}\n"
	end
	
	def validate_phone(phone)		
		unless phone =~ /\A\+?\d{11}\z/ then
			false
		end
		true
	end
	
	def set_contacts (phone:, tme:, mail:)
		self.mail = mail if(mail!=nil)
		self.tme = tme if(tme!=nil)
		self.phone = phone if(phone!=nil)
	end	
	
	private 
	attr_writer :id, :name, :lastName, :midleName, :git
	
	def validate_mail(mail)		
		unless mail =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i then
			false
		end
		true
	end
	
	def validate_git(git)
		unless git =~ /github.*/  then
			false
		end
		true
	end
	
	def validate_tme(tme)		
		unless tme =~ /tme.*/ then
			false
		end
		true
	end
	
	
	def validate_git_precence
		if self.git then
			true
		else
			false
		end
	end
	
	def validate_contacts_precence
		self.phone || self.tme || self.mail 
	end
	
	def validate
		validate_git_precence || validate_contacts_precence
	end
	
	def phone= (phone)
		unless validate_phone(phone) || phone then
			raise ArgumentError, "Задан неверный формат номера"
		else
			@phone = phone
		end
	end
	
	def mail=(mail)		
		unless validate_mail(mail) || mail then
			raise ArgumentError, "Задана неверная почта"
		else
			@mail = mail
		end
	end
	
	def tme=(tme)		
		unless validate_tme(tme) || tme then
			raise ArgumentError, "Контакт задан неверно"
		else 
			@tme = tme
		end
	end
	
	
		
		
end

stud = Student.new(lastName: "Петренко",name: "Роман",midleName: "Николаевич",phone: "+71234567890")
print stud.to_s
stud.set_contacts(phone: "+71234567890",tme: "tme/petrnik",mail: "rom.pet@mail.ru")
print stud.to_s
