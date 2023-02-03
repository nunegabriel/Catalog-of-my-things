require_relative './item'
require_relative 'functions'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    if @on_spotify && @archived
      true
    else
      false
    end
  end
end
