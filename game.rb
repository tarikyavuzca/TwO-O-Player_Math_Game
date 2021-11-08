class Game

  # create player 1 and player 2 object
  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
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
  end

  def starting_game
    players = ["Player1", "Player2"]
    (players).each do |player|
      puts "\n#{player}: READY to start?"
      print "> "
      answer = gets.chomp
      
      while answer != "y"
        puts "Please type 'y' to start. READY to start?"
        print "> "
        answer = gets.chomp
      end
    end
  end

  #  

end
