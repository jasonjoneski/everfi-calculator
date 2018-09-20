class TerminalOperation
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def calculate()
    return value
  end

  def to_s
    return value
  end
end
