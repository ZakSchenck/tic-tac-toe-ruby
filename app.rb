class Player
  attr_accessor :text, :name

  def initialize(text, name)
    @text = text
    @name = name
  end
end

class Game < Player
  attr_accessor :game_board, :isActive, :current_player

  def initialize()
    @game_board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @isActive = true
    @current_player = PlayerX
  end

  def start_game()
    puts "Here is your gameboard! Choose the index!"
    puts "#{@game_board[0..2]}"
    puts "#{@game_board[3..5]}"
    puts "#{@game_board[6..8]}"
    puts "===================="
    while @isActive
      puts "#{@current_player.name}'s Turn!"
      allowedInput = [0, 1, 2, 3, 4, 5, 6, 7, 8]

      user_input = gets.chomp
      puts "===================="

      @game_board.delete(Integer(user_input))
      @game_board.insert(Integer(user_input), @current_player.text)
      @game_board.shift(0)

      puts "#{@game_board[0..2]}"
      puts "#{@game_board[3..5]}"
      puts "#{@game_board[6..8]}"
      puts "===================="

      checkWinner()

      if (@current_player === PlayerX)
        @current_player = PlayerO
      else
        @current_player = PlayerX
      end
    end
  end

  def checkWinner()
    if (@game_board[0..2].all? { |text| text == @current_player.text } ||
        @game_board[3..5].all? { |text| text == @current_player.text } ||
        @game_board[6..8].all? { |text| text == @current_player.text } ||
        @game_board[(0..6) % 3].all? { |text| text == @current_player.text } ||
        [@game_board[1], @game_board[4], @game_board[7]].all? { |text| text == @current_player.text } ||
        [@game_board[2], @game_board[5], @game_board[8]].all? { |text| text == @current_player.text } ||
        [@game_board[0], @game_board[4], @game_board[8]].all? { |text| text == @current_player.text } ||
        [@game_board[2], @game_board[4], @game_board[6]].all? { |text| text == @current_player.text })
      puts "#{@current_player.name} Wins!!!"
      @isActive = false
    end
  end
end

PlayerX = Player.new("X", "Player One")
PlayerO = Player.new("O", "Player Two")
NewGame = Game.new
NewGame.start_game
