require_relative './book'
require_relative './label'
require_relative './app'
require_relative './game'
require_relative './music_album'
require_relative './genre'
require_relative './author'
require 'json'

module Storage
  def load_books
    book_file = 'book.json'
    return [] unless File.exist?(book_file) && !File.read(book_file).empty?

    JSON.parse(File.read(book_file)).map do |book|
      Book.new(book['name'], book['publisher'], book['publish_date'], book['cover_state'])
    end
  end

  def save_books
    book_data = @books.map do |book|
      { name: book.name, publisher: book.publisher, publish_date: book.publish_date, cover_state: book.cover_state }
    end
    File.write('book.json', JSON.pretty_generate(book_data))
  end

  def save_labels
    label_data = @labels.map { |label| { title: label.title, color: label.color } }
    File.write('label.json', JSON.pretty_generate(label_data))
  end

  def load_labels
    file = 'label.json'
    return [] unless File.exist?(file) && !File.read(file).empty?

    JSON.parse(File.read(file)).map do |element|
      Label.new(element['title'], element['color'])
    end
  end

  def save_music_albums
    album_data = @music_albums.map do |music_album|
      { name: music_album.name, publish_date: music_album.publish_date, on_spotify: music_album.on_spotify }
    end
    File.write('music_albums.json', JSON.pretty_generate(album_data))
  end

  def load_album
    file = 'music_albums.json'
    return [] unless File.exist?(file) && !File.read(file).empty?

    JSON.parse(File.read(file)).map do |music_album|
      MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify'])
    end
  end

  def save_genres
    genre_data = @genres.map { |genre| { name: genre.name } }
    File.write('genre.json', JSON.pretty_generate(genre_data))
  end

  def load_genres
    file = 'genre.json'
    data = []
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |element|
      data.push(Genre.new(element['name']))
    end
    data
  end

  def save_games
    data = @games.map do |game|
      { multiplayer: game.multiplayer, publish_date: game.publish_date, last_played_date: game.last_played_date }
    end
    File.write('games.json', JSON.pretty_generate(data))
  end

  def load_games
    file = 'games.json'
    return [] unless File.exist?(file)

    JSON.parse(File.read(file)).map do |game_data|
      Game.new(game_data['multiplayer'], game_data['last_played_date'], game_data['publish_date'])
    end
  rescue JSON::ParserError
    []
  end

  def load_authors
    file = 'authors.json'
    return [] unless File.exist?(file)

    JSON.parse(File.read(file)).map do |author_data|
      Author.new(author_data['first_name'], author_data['last_name'])
    end
  rescue JSON::ParserError
    []
  end

  def save_authors
    authors_data = @authors.map do |author|
      { first_name: author.first_name, last_name: author.last_name }
    end
    File.write('authors.json', JSON.pretty_generate(authors_data))
  end
end
