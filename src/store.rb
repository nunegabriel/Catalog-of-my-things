require_relative './music_album'
require_relative './genre'
# require_relative './game'
require_relative './app'
require 'json'

module Storage
  def save_music_albums
    album_file = 'music_albums.json'
    album_data = @music_albums.map do |music_album|
      { name: music_album.name, publish_date: music_album.publish_date, on_spotify: music_album.on_spotify }
    end
    File.write(album_file, JSON.pretty_generate(album_data))
  end

  def load_album
    album_file = 'music_albums.json'
    return [] unless File.exist?(album_file) && !File.read(album_file).empty?

    album_data = JSON.parse(File.read(album_file))
    album_data.map do |music_album|
      MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify'])
    end
  end

  def save_genres
    genre_file = 'genre.json'
    genre_data = @genres.map { |genre| { name: genre.name } }
    File.write(genre_file, JSON.pretty_generate(genre_data))
  end
end
