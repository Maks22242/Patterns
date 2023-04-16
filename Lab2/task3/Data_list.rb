require_relative 'Data_table'

class Data_list

  # private_class_method :new
  
  attr_writer :list

  def initialize(list)
    self.list = list
    self.select_items = []
  end

  #Выделить элемент по номеру
  def select(nunber)
    select_items.append(nunber)
  end

  #получаем массив выделеных элементов
  def get_selected
    return [] if select_items.empty?
    selected_id_list = []
    select_items.each do |num|
      selected_id_list.append(list[num].id)
    end
    selected_id_list
  end

  def get_data
    result = []
    ind = 0
    list.each do |obj|
      row = []
      row << ind
      # * необходима так как, если нам передадут [1,2,3], то передастся row.push(1,2,3)
      row.push(*table_fields(obj))
      result << row
      ind += 1
    end
    DataTable.new(result)
  end

  def get_names
  end

  def table_fields(object)
    []
  end


  private

  attr_accessor :select_items
  attr_writer :list

end

list = Data_list.new([1,2,3,4,5,6,8])
