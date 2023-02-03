require_relative './store'

class Handler
  include Storage

  # option to list all labels
  def labels
    return puts 'No labels listed!!!' if @labels.empty?

    @labels.each_with_index do |label, i|
      puts "#{i + 1} | Title : #{label.title} | Color: #{label.color}"
    end
  end

  # list all books
  def books
    return puts 'No books listed!!!' if @books.empty?

    @books.each_with_index do |book, i|
      puts "#{i + 1} - Name: #{book.name} | Publisher: #{book.publisher} | Date: #{book.publish_date} | Cover State: #{book.cover_state}"
    end
  end

  def new_author
    print 'Enter first name of Author: '
    first_name = gets.chomp
    print 'Enter last name of Author: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def add_label(type)
    print "Label of the #{type}: "
    title = gets.chomp
    print "Color of the #{type}: "
    color = gets.chomp
    Label.new(title, color)
  end

  def add_book
    author = new_author
    label = add_label('Book')
    title = get_input('Book name: ')
    publisher = get_input('Name of Publisher: ')
    date = get_input('Year of publication: ')
    cover_state = get_input('Cover state? (good/bad): ').upcase
    book = Book.new(title, publisher, date, cover_state)
    label.add_item(book)
    author.add_item(book)
    @books.push(book)
    @labels.push(label)
    @authors.push(author)
    puts "#{book.name} by #{author.first_name} #{author.last_name} Add book successfully"
    save_books
    save_labels
    save_authors
  end

  def get_input(prompt)
    print prompt
    gets.chomp
  end

  def add_game
    multiplayer = get_input('Please write multiplayer: ')
    publish_date = get_input('Date of publication [format (yyyy-mm-dd)]: ')
    last_played_date = get_input('last played date [format (yyyy-mm-dd)]: ')
    @games.push(Game.new(multiplayer, publish_date, last_played_date))
    puts 'Game created'
    save_games
  end

  def games
    puts 'Available Games:'
    @games.each do |games|
      puts "Multiplayer: #{games.multiplayer}, Publish Date: #{games.publish_date},
      Last played date: #{games.last_played_date}"
    end
  end

  def authors
    puts 'Authors:'
    @authors.each do |author|
      puts "First Name: #{author.first_name} | Last Name: #{author.last_name}"
    end
  end

  # list all music_albums
  def albums
    return puts 'No music albums listed!!!' if @music_albums.empty?

    @music_albums.each_with_index do |music_album, i|
      puts "#{i + 1} - Name: #{music_album.name} | Date: #{music_album.publish_date} | On spotify: #{music_album.on_spotify}"
    end
  end

  def genres
    if @genres.empty?
      puts 'No genres added!!!'
    else
      @genres.each_with_index do |genre, i|
        puts "#{i + 1} | Name : #{genre.name}"
      end
    end
  end

  def add_music_album
    name = get_input('Album name:')
    genre_name = get_input('Genre:')
    genre = Genre.new(genre_name)
    @genres.push(genre)
    save_genres

    publish_date = get_input('Date of publish [Enter date in format (yyyy-mm-dd)]:')
    on_spotify = get_input('Is it available on Spotify? Y/N:').downcase

    album = MusicAlbum.new(name, publish_date, on_spotify == 'y')
    @music_albums.push(album)

    puts 'Music album created'
    save_music_albums
  end
end
