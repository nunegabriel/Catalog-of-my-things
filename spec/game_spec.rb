require_relative '../src/game'
require_relative '../src/item'
require_relative 'spec_helper'
require 'yaml'

describe Game do
  before :each do
    @game = Game.new 'TETRIS', '2012-02-01', '2012-12-01'
  end

  it 'last played date is 2012-12-01' do
    expect @last_played_at == '2012-12-01'
  end

  it 'game should be an archived' do
    expect(@game.can_be_archived?).to be true
  end
end
