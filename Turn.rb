class Turn
  # Get id for display purposes and create new Question object
  def initialize(name)
    @name = name 
    @question = Questions.new
  end

  # Asks the current player a question
  # Returns true if they answered correctly, otherwise false
  
  def ask_question
    puts "#{@name}: #{@question.disp_question}"
    print "> "
    player_answer = gets.chomp.to_i

    # Checks to see if they answered correctly
    if (player_answer == @question.check_answer)
      puts "#{@id}: YES! You are correct!"
      true
    else 
      puts "#{@id}: Seriously? No!"
      false
    end
  end

  

end