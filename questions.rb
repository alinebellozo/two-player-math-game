class Questions

  attr_reader :result
  
  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @result = @number1 + @number2
  end

  def question
    puts "What does #{@number1} plus #{@number2} equal?"
  end

  def check_answer(answer)
    answer == @result
  end

end