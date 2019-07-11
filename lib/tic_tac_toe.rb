require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6]
  ]
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    index = num.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
    @board
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if (0..8).include?(index) && @board[index] == " "
      true
    else
      false
    end
  end

  def turn_count
    filled_spaces = @board.reject{|space| space == " "}
    filled_spaces.count
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Your move."
    player_move = gets.chomp
    index = input_to_index(player_move)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      puts "Not a valid move; please try again."
      player_move = gets.chomp
    end
  end

  def won?
    #maybe make arrays of the index for each X and for each O
    #and if one of those contains the winning numbers, then win?
    xs = []
    os = []
    win_combo = nil
    @board.each_with_index do |letter, index|
      # binding.pry
      if letter == "X"
        xs << index
      elsif letter == "O"
        os << index
      end
    end
    #check if the xs array or the os array has the same numbers
    #as any of the WIN_COMBINATIONS arrays

    #this returns true:
    #WIN_COMBINATIONS[3].all? {|num| xs.include?(num)}

    WIN_COMBINATIONS.each do |array|
      if array.all? {|num| xs.include?(num)}
        win_combo = array
        @winner = "X"
      elsif array.all? {|num| os.include?(num)}
        win_combo = array
        @winner = "O"
      else
      end
    end
    win_combo
  end

  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    if full? == true && won? == nil
      true
    elsif full? == true && won? == true
      false
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if won? == true
      @winner
    end
    @winner
  end

  # def play
  #   until over? == true
  #     turn
  #   end
  #   # if won? == true
  #   #   puts "Congratulations, #{@winner}!"
  #   # elsif draw? == true
  #   #   puts "The game was a draw."
  #   # else
  #   #   puts "Error."
  #   # end
  # end

end
