require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase
  setup do
      @calculator = Calculator.new(OperationParser.new)
  end

  test "calculate raises error on invalid input." do
    assert_raises(CalculatorError) do
      @calculator.calculate("a+b")
    end
    assert_raises(CalculatorError) do
      @calculator.calculate("+1")
    end
    assert_raises(CalculatorError) do
      @calculator.calculate("0+1/a")
    end
  end

  test "calculate handles whitespace" do
    @calculator.calculate(" 1 + 3 / 2")
  end

  test "calculate calculates correctly" do
    assert_calc 919, "5*3+1+6/2+9*100"
    assert_calc 916.07, "5*3+1+6/85+9*100"
    assert_calc 221.77, "9*12/15+1+6*900/30+30-20+165/7"
    assert_calc 0, "0"
    assert_calc -2, "0-2"
    assert_calc 215300.07, "20/300+300+90000+50/2*5000"
    assert_calc 4, "2+2"
    assert_calc 81, "9*9"
    assert_calc 1.5, "3/2"
    assert_calc 5, "10-5"
  end

  private
  def assert_calc(expected, formula)
    assert_equal expected, @calculator.calculate(formula)
  end
end
