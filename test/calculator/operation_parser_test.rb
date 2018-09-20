require 'test_helper'

class OperationParserTest < ActiveSupport::TestCase
  setup do
    @operation_parser = OperationParser.new
  end

  test "parse returns valid tree for 6/2" do
    operation = @operation_parser.parse "6/2"
    assert_instance_of DivideOperation, operation
    assert_instance_of TerminalOperation, operation.left
    assert_equal 6, operation.left.value
    assert_instance_of TerminalOperation, operation.right
    assert_equal 2, operation.right.value
  end

  test "parse returns valid tree for '2*3+6/1'" do
    operation = @operation_parser.parse "2*3+6/1"
    assert_instance_of PlusOperation, operation
    assert_instance_of MultiplyOperation, operation.left
    assert_instance_of TerminalOperation, operation.left.left
    assert_equal 2, operation.left.left.value
    assert_equal 3, operation.left.right.value
    assert_instance_of DivideOperation, operation.right
    assert_instance_of TerminalOperation, operation.right.left
    assert_equal 6, operation.right.left.value
    assert_equal 1, operation.right.right.value
  end

  test "parse returns valid tree for '2*3+6/1-6-1'" do
    operation = @operation_parser.parse "2*3+6/1-6-1"

    assert_instance_of MinusOperation, operation
    assert_instance_of MinusOperation, operation.left
    assert_instance_of TerminalOperation, operation.right
    assert_instance_of TerminalOperation, operation.left.right
    assert_equal 6, operation.left.right.value

    left2_operation = operation.left.left
    assert_instance_of PlusOperation, left2_operation
    assert_instance_of MultiplyOperation, left2_operation.left
    assert_instance_of TerminalOperation, left2_operation.left.left
    assert_equal 2, left2_operation.left.left.value
    assert_equal 3, left2_operation.left.right.value
    assert_instance_of DivideOperation, left2_operation.right
    assert_instance_of TerminalOperation, left2_operation.right.left
    assert_equal 6, left2_operation.right.left.value
    assert_equal 1, left2_operation.right.right.value
  end
end
