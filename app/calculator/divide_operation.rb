class DivideOperation < BinaryOperation
  def initialize(left, right)
    super("/", left, right)
  end

  def calculate()
    return left.calculate().to_f / right.calculate().to_f
  end
end
