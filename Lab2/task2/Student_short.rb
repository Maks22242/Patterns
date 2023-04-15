require_relative 'Student_super'

class Student_short < Student_super
  attr_accessor :short_name, :contact

  def initialize(student)
    @id = student.id
    @short_name = student.short_name
    @git = student.git
    @contact = student.set_contacts(phone: student.phone, mail: student.mail, tme: student.tme)
  end

  def self.initz_from_str(id,str)
    student = stud2 = Student.iniz(str)
    student.id = id
    Student_short.new(student)

  end

  def to_s
    "id: #{@id}, short_name: #{@short_name}, contact: #{@contact}, git: #{@git}\n"
  end

  def get_info
    git_info = "#git: #{git}" unless git.nil
    "#{short_name} git:#{git_info} contact:#{contact}"
  end
end
