class PlusOperation < BinaryOperation
  def initialize(left, right)
    super("+", left, right)
  end

  def calculate()
    return left.calculate() + right.calculate()
  end
end
