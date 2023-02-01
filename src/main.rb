require_relative './app'

def main
  puts 'Welcome'

  app = App.new

  loop do
        app.first_choices
  end
end

main
