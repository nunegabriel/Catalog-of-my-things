require_relative '../src/item'
require_relative '../src/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('nunes', '2099-09-03', true)
  end

  it 'should be true if archived' do
    expect(@music.can_be_archived?).to be nil
  end
end
