class Student 

	def initialize(lastName,name,midleName)
		@id
		@lastName = lastName
		@name = name
		@midleName = midleName
		@phone
		@tme
		@mail
		@git
	end
	
	def getid
		@id
	end
	def setid(id)
		@id = id
	end
	
	def getname
		@name
	end
	def setname(name)
		@name = name
	end
	
	def getmidleName
		@midleName
	end
	def setmidleName(midleName)
		@midleName = midleName
	end
	
	def getlastName
		@lastName
	end
	def setlastName(lastName)
		@lastName = lastName
	end
	
	def getphone
		@phone
	end
	def setphone(phone)
		@phone = phone
	end
	
	def gettme
		@tme
	end
	def settme(tme)
		@tme = tme
	end
	
	def getmail
		@mail
	end
	def setmail(mail)
		@mail = mail
	end
	
	def getgit
		@git
	end
	def setgit(git)
		@git = git
	end
	
	def to_s
		"id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @tme #{@tme}, mail #{@mail}, git: #{@git}\n"
	end
	
end




