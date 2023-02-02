class Functions
    def initialize
        @albums = []
        @genres = []
        @music = []
    end
end

def list_music_album(albums)
    if @albums.empty?
        puts 'No albums found'
    else
        albums.each do |album|
            puts 'found'
        end
    end
end

def list_genres(genres)
    if @genres.empty?
        puts 'No genres found'
    else
        genres.each do |genre|
            puts 'found'
        end
    end
end