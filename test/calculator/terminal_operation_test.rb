require 'test_helper'

class TerminalOperationTest < ActiveSupport::TestCase
  test "TerminalOperation.new creates valid object." do
    terminal = TerminalOperation.new(10)
    assert_equal 10, terminal.value
  end

  test "calculate returns value." do
    terminal = TerminalOperation.new(10)
    assert_equal 10, terminal.calculate()
  end
end
