class OperationParseError < StandardError
end

class OperationParser
  OPERATOR_CLASSES = {
    "+" => PlusOperation,
    "-" => MinusOperation,
    "*" => MultiplyOperation,
    "/" => DivideOperation
  }.freeze

  def parse(operation)
    if operation.match(/^\d+$/)
      return TerminalOperation.new(operation.to_i)
    elsif i = operation.rindex(/[+-]/)
      operator, left, right = split_operator_string(operation, i)
      return OPERATOR_CLASSES[operator].new(parse(left), parse(right))
    elsif i = operation.rindex(/[*\/]/)
      operator, left, right = split_operator_string(operation, i)
      return OPERATOR_CLASSES[operator].new(parse(left), parse(right))
    else
      raise OperationParseError, "#{operation} is not a valid operation string."
    end
  end

  private
  def split_operator_string(operation, i)
    operator = operation[i]
    left = operation[0, i]
    right = operation[i + 1, operation.length - i]

    return operator, left, right
  end
end
