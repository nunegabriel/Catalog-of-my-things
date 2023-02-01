require 'item'

class MusicAlbum < Item
  atter_reader :on_spotify

  def initialize(publish_date, on_spotify, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    @on_spotify && @archived
  end
end
