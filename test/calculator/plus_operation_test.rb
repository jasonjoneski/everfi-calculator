require 'test_helper'

class PlusOperationTest < ActiveSupport::TestCase
  test "PlusOperation.new creates valid object." do
    term1 = TerminalOperation.new(10)
    term2 = TerminalOperation.new(10)
    operation = PlusOperation.new(term1, term2)

    assert_equal "+", operation.operator
    assert_equal term1, operation.left
    assert_equal term2, operation.right
  end

  test "calculate adds left and right together." do
    term1 = TerminalOperation.new(5)
    term2 = TerminalOperation.new(7)
    operation = PlusOperation.new(term1, term2)

    assert_equal 12, operation.calculate()
  end

  test "calculate to_s outputs correctly." do
    term1 = TerminalOperation.new(5)
    term2 = TerminalOperation.new(7)
    operation = PlusOperation.new(term1, term2)

    assert_equal "5 + 7", operation.to_s
  end
end
