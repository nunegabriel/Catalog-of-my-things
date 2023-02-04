require_relative '../src/genre'
require_relative '../src/item'
describe Genre do
  context 'when testing genre class mthods' do
    name = 'rock'
    genre = Genre.new(name)
    item = Item.new('2012-1-10', false)
   
    it 'returns name instance of the genre class ' do
      expect(genre.name).to equal(name)
    end

    it 'items array' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
