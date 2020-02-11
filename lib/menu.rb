require_relative './input_validator_helper.rb'
module MenuHelper
  include ValidatorHelper
  def table(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]}"
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]}"
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]}"
  end

  def welcome_message
    puts 'Welcome to Tic-Tac-Toe!'
  end

  def player_one_info(player)
    welcome_message
    puts 'Player 1 - Please enter your name:'
    player.username_one = gets.chomp

    if validate_name(player.username_one)

    else
      puts 'Sorry! Invalid name. Try again.'
      puts 'Player 1 - please enter your name: '
      player.username_one = gets.chomp
      if validate_name(player.username_one)
        puts 'Okay, good name!'
      else
        puts "Your name is invalid again. We'll just call you 'Player 1'"
        player.username_one = 'Player 1'
      end
    end
    puts ''
  end

  def player_two_info(player)
    puts 'Player 2 - Please enter your name:'
    player.username_two = gets.chomp

    if validate_name(player.username_two)
    else
      puts 'Sorry! Invalid name. Try again.'
      puts 'Player 2 - please enter your name: '
      player.username_two = gets.chomp
      if validate_name(player.username_two)
        puts 'Okay, good name!'
      else
        puts "Your name is invalid again. We'll just call you 'Player 1'"
        player.username_two = 'Player 2'
      end
    end
    puts ''
  end

  def notice(players)
    puts "#{players.username_one} you will play as X"
    puts "#{players.username_two} you are gonna be O"
    puts ''
  end

  def end_message(player_one, player_two)
    puts 'Would you like to play again?'
    puts ''
    puts 'Answer with yes or no'
    choice = gets.chomp.downcase
    until validate_choice(choice) == true
      puts 'Answer with yes or no'
      choice = gets.chomp.downcase
      validate_choice(choice)
    end

    if choice == 'yes'
      play_again(player_one, player_two)
    elsif choice == 'no'
      quit
    end
  end

  def quit
    puts ''
    puts 'Goodbye, glad you enjoyed our game!'
  end

  def play_again(player_one, player_two)
    run = TicTacToe.new
    run.show_board
    run.play(player_one, player_two)
  end

  def custom_message_one(player_one, player_two)
    puts "#{player_one} is the winner"
    end_message(player_one, player_two)
  end

  def custom_message_two(player_one, player_two)
    puts "#{player_two} is the winner"
    end_message(player_one, player_two)
  end
end
