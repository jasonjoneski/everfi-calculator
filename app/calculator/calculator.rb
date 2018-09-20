class CalculatorError < StandardError
end

class Calculator
  attr_reader :parser

  def initialize(parser)
    @parser = parser
  end

  def valid?(formula)
    clean_formula = cleanup(formula)
    return clean_formula.match(/^\d+([+\-*\/]\d+)*$/)
  end

  def calculate(formula)
    clean_formula = cleanup(formula)
    if (!valid?(formula))
      raise CalculatorError, "#{formula} is not a valid calculate string."
    end

    root_operator = parser.parse(clean_formula)
    calculation = root_operator.calculate()

    return calculation.round(2)
  end

  private
  def cleanup(formula)
    return formula.gsub(/\s+/, '')
  end
end
