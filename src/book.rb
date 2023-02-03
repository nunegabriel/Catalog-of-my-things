require_relative './item'

class Book < Item
  attr_accessor :name, :publisher, :cover_state, :label, :author, :publish_date

  def initialize(name, publisher, publish_date, cover_state)
    super(publish_date, archived: archived)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

 
  def can_be_archived?
    super || cover_state == 'bad'
  end


  def as_json
    {
      id: @id,
      publisher: @publisher,
      publish_date: @publish_date,
      cover_state: @cover_state,
      archived: @archived,
      label: label_json,
      author: author_json
    }
  end
  
  private
  
  def label_json
    {
      id: label.id,
      title: label.title,
      color: label.color
    }
  end
  
  def author_json
    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end
 end
