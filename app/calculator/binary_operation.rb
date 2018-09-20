class BinaryOperation
  attr_reader :operator, :left, :right

  def initialize(operator, left, right)
    @operator = operator.freeze
    @left = left
    @right = right
  end

  def to_s
    return "#{left.to_s} #{operator} #{right.to_s}"
  end
end
