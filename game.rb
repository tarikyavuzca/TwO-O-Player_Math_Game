class Game
  
  # create player 1 and player 2 object
  # declearing the current player
  # players variable
  def initialize
    @player1 = Players.new("Player1")
    @player2 = Players.new("Player2")
    @current_player = @player1
    @players = ["Player1", "Player2"]
  end

  # game description to prompt when the game starts, calls starting_game method
  def description
    puts "Welcome to the Math Game!"
    puts "Each player has 3 lives, and you lose a life\nwhen you answer a question incorrectly."
    puts "When either one of the players runs out of\nlives, the game ends."
    puts "If you're ready to start, type 'y' in the prompt"
    starting_game
  end

  # starting game method asks the user if they are ready to play, calls whos_turn method
  def starting_game
    # looping over the players
    (@players).each do |player|
      puts "\n#{player}: READY to start?"
      print "> "
      answer = gets.chomp
      # asks until they are ready
      while answer != "y"
        puts "Please type 'y' to start. READY to start?"
        print "> "
        answer = gets.chomp
      end
    end
    whos_turn
  end

  # whos_turn method calls the Turn class accepts the current player as a parameter
  # asks the questions
  # if the answer is false, it decreases the life of the current player
  # display the score after the round
  # if one of the player has no life, the game ends
  def whos_turn
    turn = Turn.new(@current_player.name)
    answer = turn.ask_question

    if answer == false
      @current_player.decreasing_life
    end

    disp_scores

    if @current_player.remaining_lives == 0
      game_over
    else
      switch
      puts "\n----- NEW TURN -----"
      whos_turn
    end
  end

  # switch method to switch between the players
  def switch
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # displaying the score
  def disp_scores
    puts "P1: #{@player1.remaining_lives}/3 vs P3 #{@player2.remaining_lives}/3"
  end

  # game_over method to end the game and display the winner
  def game_over
    puts  puts "\n #{@current_player.name} is out of lives!"
    switch

    puts "#{@current_player.name} wins with a score of #{@current_player.remaining_lives}/3"

    puts "\n----- GAME OVER -----"
    puts "Thank you for playing, good bye!"
    exit(0)
  end

end
