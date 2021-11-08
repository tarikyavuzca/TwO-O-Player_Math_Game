class Game
  
  # create player 1 and player 2 object
  def initialize
    @player1 = Players.new("Player1")
    @player2 = Players.new("Player2")
    @current_player = @player1
    @players = ["Player1", "Player2"]
  end

  def description
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Welcome to the Math Game!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Each player has 3 lives, and you lose a life\nwhen you answer a question incorrectly."
    puts "----"
    puts "When either one of the players runs out of\nlives, the game ends."
    puts "----"
    puts "If you're ready to start, type 'y' in the prompt"
    starting_game
  end

  def starting_game
    (@players).each do |player|
      puts "\n#{player}: READY to start?"
      print "> "
      answer = gets.chomp
      
      while answer != "y"
        puts "Please type 'y' to start. READY to start?"
        print "> "
        answer = gets.chomp
      end
    end
    whos_turn
  end


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

  def switch
    @current_player = @current_player == @player1 ? @player2 : @player1
  end


  def disp_scores
    puts "P1: #{@player1.remaining_lives}/3 vs P3 #{@player2.remaining_lives}/3"
  end

  def game_over
    puts  puts "\n #{@current_player.name} is out of lives!"
    switch

    puts "#{@current_player.name} wins with a score of #{@current_player.remaining_lives}/3"

    puts "\n----- GAME OVER -----"
    puts "Thank you for playing, good bye!"
    exit(0)
  end

end
