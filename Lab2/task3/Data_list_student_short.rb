require_relative 'Data_list'
require_relative 'Data_table'
require_relative 'Students/Student_short'

class Data_list_student_short < Data_list

  public_class_method :new

  def get_names
    ["short_names","git","contact"]
  end

  def get_date
    result = []
    id = 0
    list.each do |obj|
      row = []
      row << id
      row.push(*table_fields(obj))
      result << row
      id += 1
    end
    Data_table.new(result)
  end

  protected


  def table_fields(object)
    [object.short_name, object.git, object.contact]
  end

end
