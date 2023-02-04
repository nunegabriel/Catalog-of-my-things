require_relative '../src/author'
require_relative '../src/item'
require 'yaml'

describe Author do
  before :each do
    @author = Author.new('gabz', 'lee')
  end

  it '@author should be an instance of Author class' do
    expect(@author).to be_an_instance_of Author
  end

  it 'author first name to be' do
    @first_name == 'gabz'
  end

  it 'author last name to be' do
    @last_name == 'lee'
  end

  it 'should return the item passed into items' do
    new_item = Item.new('2020-01-01', false)
    @author.add_item(new_item)
    expect(@author.items).to include(new_item)
  end
end
