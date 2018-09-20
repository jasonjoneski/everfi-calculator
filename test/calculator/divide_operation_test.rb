require 'test_helper'

class DivideOperationTest < ActiveSupport::TestCase
  test "DivideOperation.new creates valid object." do
    term1 = TerminalOperation.new(10)
    term2 = TerminalOperation.new(10)
    operation = DivideOperation.new(term1, term2)

    assert_equal "/", operation.operator
    assert_equal term1, operation.left
    assert_equal term2, operation.right
  end

  test "calculate adds left and right together." do
    term1 = TerminalOperation.new(10)
    term2 = TerminalOperation.new(5)
    operation = DivideOperation.new(term1, term2)

    assert_equal 2, operation.calculate()
  end

  test "calculate to_s outputs correctly." do
    term1 = TerminalOperation.new(10)
    term2 = TerminalOperation.new(5)
    operation = DivideOperation.new(term1, term2)

    assert_equal "10 / 5", operation.to_s
  end
end
