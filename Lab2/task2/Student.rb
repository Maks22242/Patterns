class Student
  attr_accessor :id, :name, :lastName, :midleName, :git
  attr_reader :phone, :tme, :mail

  def initialize(lastName: ,name: ,midleName:, id: nil, phone: nil, mail: nil, git: nil, tme:nil)

    raise ArgumentError, "Один из обязательных параметров задан неврно" unless name && lastName && midleName

    self.id =id
    self.lastName = lastName
    self.name = name
    self.midleName = midleName
    self.git = git
    set_contacts(phone: phone, tme: tme, mail: mail)
  end

  def self.iniz(info)
    raise "Not enough data or exists unnecessary data!(split[,])"if (info.count(',') < 2|| info.count(',') > 7)
    hash_data = Student.string_info_in_hash(info.delete(' ').split(','))

    Student.new(lastName:hash_data[:lastName] ,name:hash_data[:name] ,midleName:hash_data[:midleName], id: hash_data[:id], phone: hash_data[:phone], mail: hash_data[:mail], git: hash_data[:git], tme:hash_data[:tme])
  end

  def self.string_info_in_hash(arr_info)
    hash_info = Hash.new
    hash_info[:lastName] = arr_info[0]
    hash_info[:name] = arr_info[1]
    hash_info[:midleName] =  arr_info[2]
    for iter in 3...arr_info.count
      hash_info[:phone] = arr_info[iter] if Student.validate_phone(arr_info[iter])
      hash_info[:tme] = arr_info[iter] if (validate_tme(arr_info[iter]))
      hash_info[:mail] = arr_info[iter] if (Student.validate_mail(arr_info[iter]))
      hash_info[:git] = arr_info[iter] if (validate_git(arr_info[iter]))
    end
    hash_info
  end

  #возвращает Фамилия и Инициалы;
  def short_name
    "#{lastName} #{name[0]}. #{midleName[0]}."
  end

  # Проверяет наличие контактов
  def exist_contact?
    !(tme.nil? && mail.nil? && phone.nil?)
  end
  # Возвращает любой контакт (при его наличии)
  def find_contact
    if exist_contact?
      return "phone: #{phone}" unless phone.nil?
      return "telegram: #{tme}" unless tme.nil?
      return "mail: #{mail}" unless mail.nil?
    end
    nil
  end

  # возвращает краткую информацию о студенете
  def get_info
    git_info = "#git: #{git}" unless git.nil?
    contact_info = "#{find_contact}" unless find_contact.nil?
    "#{short_name} #{git_info} #{contact_info}"
  end


  def to_s
    "id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @tme #{@tme}, mail #{@mail}, git: #{@git}\n"
  end

  def set_contacts (phone: nil, tme:nil,  mail:nil)
    @mail = mail if (mail!=nil)
    @tme = tme if(tme!=nil)
    @phone = phone if(phone!=nil)
  end

  private

  def self.validate_phone(phone)
    if(phone =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/)
      true
    else
      false
    end
  end


  def self.validate_mail(mail)
    if(mail =~ /^\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      true
    else
      false
    end
  end

  def self.validate_git(git)
    unless git =~ /github.*/
      false
    else
      true
    end
  end

  def self.validate_tme(tme)
    unless tme =~ /https?:\/\/t\.me\/[a-zA-Z0-9_]{5,}/
      false
    else
      true
    end
  end

  def validate_git_precence
    if self.git
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

  def phone=(phone)
    unless Student.validate_phone(phone) || phone
      raise ArgumentError, "Задан неверный формат номера"
    else
      @phone = phone
    end
  end

  def mail=(mail)
    unless Student.validate_mail(mail) || mail then
      raise ArgumentError, "Задана неверная почта"
    else
      @mail = mail
    end
  end

  def tme=(tme)
    unless Student.validate_tme(tme) || tme then
      raise ArgumentError, "Контакт задан неверно"
    else
      @tme = tme
    end
  end
end
