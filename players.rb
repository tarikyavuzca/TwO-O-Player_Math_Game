class Players
  
  # instance variables name, life, answer
  attr_accessor :name, :remaining_lives
  
  # initialize method
  def initialize(name)
    @name = name
    @remaining_lives = 3
  end
  
  # method the decrease the life if the answer is wrong
  def decreasing_life
    @remaining_lives -= 1
  end

end