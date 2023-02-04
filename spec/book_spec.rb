require_relative '../src/book'
require_relative '../src/label'
require_relative '../src/item'
require 'spec_helper'

describe 'Test the book class' do
  book = Book.new('hey', 'lee', '2013', 'Good')

    it 'returns the right book publisher' do
      expect(book.publisher).to eql('lee')
    end
  end

   it 'returns the publication date' do
      expect(book.publish_date).to eql('2013')
    end
  end

    it 'returns the cover state' do
      expect(book.cover_state).to eql('Good')
    end
  end
end

