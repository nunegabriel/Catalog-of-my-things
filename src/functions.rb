require_relative './store'
require 'json'

class Functions
    include Storage

def list_music_album
    if @albums.empty?
        puts 'No albums found'
    else
        albums.each do |album|
            puts 'found'
        end
    end
end

def genres
    if @genres.empty?
        puts 'No genres found'
    else
        genres.each do |genre|
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

end
end
