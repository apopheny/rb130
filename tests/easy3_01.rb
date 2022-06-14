# Write a minitest assertion that will fail if the value.odd? is not true.
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
# Write a minitest assertion that will fail if value is not nil.
# Write a minitest assertion that will fail if the Array list is not empty
# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
# Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.
# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).
# Write a test that will fail if list and the return value of list.process are different objects.
# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative '../exercise'

class TestExercises < MiniTest::Test
  def setup
    @example = Example.new
  end

  def test_odd?
    # assert(@example.value.odd?, 'Value is not odd')
  end

  def test_downcase
    # assert_equal("xyz", @example.value.downcase, "Downcase value is not \'xyz\'")
  end

  def test_nil
    # assert_nil(@example.value, "Value is not nil")
  end

  def test_array_empty?
    # assert_empty(@example.list, "Object list was not empty")
  end

  def test_list_incl_xyz?
    # assert_includes(@example.list, 'xyz', "List does not include \'xyz\'")
  end

  def test_noexperience_exception
    # assert_raises(NoExperienceError, "NoExperienceError not raised") { @example.hire }
  end

  def test_class
    # assert_instance_of(Numeric, @example.value, "Not an instance of the Numeric class")
    # assert_kind_of(Numeric, @example.value, "Not an instance of the Numeric class or one of its subclasses")
  end

  def test_list_is_process
    # assert_same(@example.list, @example.list.process, "Objects are not the same")
  end

  def test_xyz_not_in_list
    refute_includes(@example.list, 'xyz', '\'xyz\' was included in Object list')
  end
end