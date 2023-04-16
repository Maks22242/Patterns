require_relative 'Data_list'
require_relative 'Students/Student_short'

class Data_list_student_short < Data_list

  public_class_method :new

  def get_names
    ["short_names","git","contact"]
  end

  def get_data
    result = []
    id = 0
    list.each do |obj|
      row = []
      row << id
      row.push(*table_fields(obj))
      result << row
      id += 1
    end
    DataTable.new(result)
  end

  protected

  # применение паттерна Шаблон

  # сеттер для массива объектов
  def table_fields(object)
    [object.short_name, object.git, object.contact]
  end

end