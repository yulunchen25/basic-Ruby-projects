# frozen_string_literal: true

# A basic Ruby program that plays the game Tic-tac-toe on the command line

# Game class that tracks the board, plays the game and checks for a winner
class Game
  IN_A_ROW = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize(player_one, player_two)
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    display_board
    until win?
      return draw if @board.all?(/[XO]/)

      @board[@current_player.move] = @current_player.marker
      display_board
      @current_player = switch_players
    end
    @current_player = switch_players
    puts "Player #{@current_player.number} has won!"
  end

  private

  def switch_players
    @current_player == @player_one ? @player_two : @player_one
  end

  def win?
    IN_A_ROW.any? do |array|
      @board[array[0]] == @board[array[1]] && @board[array[0]] == @board[array[2]]
    end
  end

  def draw
    puts "It's a draw!"
  end
end

# Player class that tracks the moves played, players and gets player move input
class Player
  attr_reader :marker, :number

  @moves = []

  class << self
    attr_accessor :moves
  end

  def initialize(number, marker)
    @number = number
    @marker = marker
  end

  def move
    # Used begin rescue block instead of if/else to practice error handling
    begin 
      puts "Player #{@number}, marker ('#{@marker}') please enter which square to play (1-9):"
      number = gets.chomp.to_i
      raise StandardError if number < 1 || number > 9 || (self.class.moves.include? number)
    rescue StandardError
      puts 'Invalid input'
      retry
    else
      self.class.moves << number
      number -= 1
    end
  end
end

player_one = Player.new(1, 'X')
player_two = Player.new(2, 'O')
game = Game.new(player_one, player_two)
game.play
