require 'test/unit'
require_relative '../Students/Student'

class TestStudent < Test::Unit::TestCase
  def test_short_name
    student = Student.iniz("Петренко, Роман, Николаевич, +79261234567 ,makcu@mail.ru,https://t.me/lrmanga/2211")
    assert_equal('Петренко Р. Н.', student.short_name)
  end
end
