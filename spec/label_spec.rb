require_relative '../src/book'
require_relative '../src/label'
require_relative '../src/item'
require 'rspec'

describe 'Test the label class' do
  label = Label.new('It is time', 'White')

     it 'returns the right title of the label' do
      expect(label.title).to eql('It is time')
    end

    it 'returns the right color of the label' do
      expect(label.color).to eql('White')
    end

end
