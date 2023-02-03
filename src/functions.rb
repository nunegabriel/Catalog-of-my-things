require_relative './store'
require 'json'

class Functions
  include Storage

  def list_music_album
    if @albums.empty?
      puts 'No albums found'
    else
      albums.each do |_album|
        puts 'found'
      end
    end
  end

  def genres
    if @genres.empty?
      puts 'No genres found'
    else
      genres.each do |_genre|
        puts 'found'
      end
    end
  end

  def add_music_album
    print 'Album name: '
    name = gets.chomp
    print 'Genre: '
    genre_name = gets.chomp
    @genres.push(Genre.new(genre_name))
    save_genres
    print 'Date of publish: '
    publish_date = gets.chomp

    print 'available on Spotify? Y/N: '
    on_spotify = gets.chomp.upcase
    case on_spotify
    when 'Y'
      @music_albums.push(MusicAlbum.new(name, publish_date, true))
    when 'N'
      @music_albums.push(MusicAlbum.new(name, publish_date, false))
    end
    puts 'Music album has been successfully created'
    save_music_albums
  end
end
