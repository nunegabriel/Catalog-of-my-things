require_relative './item'
class Label
  attr_accessor :title, :color, :id, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def as_json
    {
      title: @title, color: @color
    }
  end
end
