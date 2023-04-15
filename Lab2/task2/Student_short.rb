require_relative 'Student_super'

class Student_short < Student_super
  attr_accessor :short_name, :contact

  def initialize(id:, short_name: ,git: nil,contact: nil)
    @id = id
    @short_name = short_name
    @git = git
    @contact = contact
    end

  def self.iniz_from_obj(student)
    contact = student.set_contacts(phone: student.phone, mail: student.mail, tme: student.tme)
    Student_short.new(id:student.id, short_name:student.short_name, git:student.git, contact: contact)
  end

  def self.initz_from_str(id:, str:)
    contacts = str.split(",")
    Student_short.new(id:id, short_name:contacts[0], contact: contacts[1], git:contacts[2])
  end

  def to_s
    "id: #{@id}, short_name: #{@short_name}, contact: #{@contact}, git: #{@git}\n"
  end

  def get_info
    git_info = "#git: #{git}," unless git.nil?
    "#{short_name} ,#{git_info} contact:#{contact}"
  end
end
