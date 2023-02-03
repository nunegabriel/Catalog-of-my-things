require_relative './book'
require_relative './label'
require_relative './music_album'
require_relative './genre'
require_relative './handler'
require_relative './game'
require_relative './author'
require_relative './store'

class App < Handler
  def initialize
    super
    @books = load_books
    @labels = load_labels
    @authors = load_authors
    @genres = load_genres
    @music_albums = load_album
    @games = load_games
  end

  def welcome
    puts 'Welcome'
   end

  def start
    welcome
    puts "Choose from below:
        1 - Show all books
        2 - Show all music albums
        3 - Show of games
        4 - Show all genres
        5 - Show all labels
        6 - Show all authors
        7 - Add a book
        8 - Add a music album
        9 - Add a game
        10- Exit"

    print 'choice: '
    choice = gets.chomp.to_i

    exit_program if choice == 10

    options(choice)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options(choice)
    case choice
    when 1
      books
    when 2
      albums
    when 3
      games
    when 4
      genres
    when 5
      labels
    when 6
      authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    else
      puts 'Select a number 1-10'
    end

    option
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def exit_program
    puts 'bye!!!'
    exit
  end

  def option
    puts 'SELECT:
    1 - CONTINUE
    2 - EXIT'

    print 'Option: '
    option = gets.chomp.to_i

    if option == 1
      start
    else
      exit_program
    end
  end
end
