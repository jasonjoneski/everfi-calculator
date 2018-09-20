class CalculatorController < ApplicationController

  def index
    @result = nil
    if (@formula = params[:formula])
      calculator = Calculator.new(OperationParser.new)
      begin
        @result = calculator.calculate(@formula)
      rescue CalculatorError => e
        @result = e.message
      end
    end
  end
end
