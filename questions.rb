class Questions
  
  # creating two rand number (check for built in random!)
  def initialize
    @number1 = rand(20) + 1
    @number2 = rand(20) + 1
  end

  # method for asking questions
  def disp_question
    "What does #{@number1} + #{@number2} = ?"
  end
  # having a method to check correct answer ?

end