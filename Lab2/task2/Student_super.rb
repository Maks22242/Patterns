class Student_super
  attr_accessor :id,  :git
  attr_reader :mail,:tme,:phone

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


  protected

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
