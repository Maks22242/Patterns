class Singleton
  # Статическая переменная класса, хранящая единственный экземпляр класса
  @@instance = Singleton.new

  # Статический метод, возвращающий единственный экземпляр класса
  def self.instance
    return @@instance
  end

  # Приватный конструктор, предотвращающий создание экземпляров класса вне его собственного метода
  private_class_method :new
end

# Создаем два экземпляра класса Singleton
singleton1 = Singleton.instance
singleton2 = Singleton.instance

# Сравниваем экземпляры класса по ссылке, должны получить true
puts singleton1 == singleton2 # true

# Попытка создать еще один экземпляр класса вызывает ошибку, так как конструктор приватный
singleton3 = Singleton.new # => private method `new' called for Singleton:Class (NoMethodError)