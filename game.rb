require "./player"
require "./questions"

class Game
 
  attr_accessor :player1, :player2, :game_over
  attr_reader :current_player

  def initialize
    @player1
    @player2
    @current_player
    @game_over = false
  end

  def insert_name
    puts "Name of Player 1:"
    player1_name = gets.chomp
    @player1 = Player.new(player1_name)
  
    puts "Name of Player 2:"
    player2_name = gets.chomp
    @player2 = Player.new(player2_name)
  end

  def switch_turns
    puts "------- NEW TURN -------"

    @current_player = @player1 ? @player1 : @player2

    # if @current_player == @player1.name
    #   @current_player = @player2.name
    # else 
    #   @current_player = @player1.name
    # end
  end

  def play

    puts "Welcome to the Two-O-Players Math Game!"
    puts "Ready to have fun? Let's go!"

    insert_name

    # while the players have more than 0 lives left, the game is not over
    while !@game_over
      
      @current_player = @player1

      puts "#{@current_player.name}, here is your question:"
      @question = Questions.new
      @question.question
      answer = gets.chomp.to_i

      # checks if the answer is correct
      if @question.check_answer(answer)
        puts "✅ Yay, the answer is correct!"
      else
        puts "❌ Oops, that is not the correct answer!"
        @current_player.lose_life
      end
      puts "----- #{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3 -----"
      
      if @current_player.lives > 0
        switch_turns
      else
        @game_over = true
        check_winner
        puts "------- GAME OVER -------"
        puts "Good bye!"
      end

    end
  
  end

  def check_winner
    if @player1.lives == 0
      puts "#{@player2.name} is the winner!"
    else
      puts "#{@player1.name} is the winner!"
    end
  end

end