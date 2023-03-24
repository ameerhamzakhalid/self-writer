class Client
  attr_reader :option

  def initialize
    options = [
      'List all books',
      'List all music albums',
      'List all movies',
      'List all games',
      'List all genres',
      'List all labels',
      'List all authors',
      'List all sources',
      'Add a book',
      'Add a music album',
      'Add a movie',
      'Add a game',
      'Exit'
    ]

    puts 'Please choose an option by entering a number:'

    options.each_with_index do |option, i|
      puts "#{i + 1} - #{option}"
    end

    @option = gets.chomp
  end

  def validate_input(message, validation = ->(input) do input != '' end)
    loop do
      print message
      input = gets.chomp
      puts 'Invalid Input' unless validation.call(input)
      return input if validation.call(input)
    end
  end

  def album_info
    date_regex = %r{^\d{4}/\d{2}/\d{2}$}
    message = 'Publish date (yyyy/mm/dd): '
    publish_date = validate_input(message, ->(input) do input.match(date_regex) end)

    message = 'Is on Spotify (Yes/No or Y/N): '
    possible_input = %w[yes no y n]
    on_spotify = validate_input(message, ->(input) do possible_input.include?(input.downcase) end)

    message = 'To add genre please type (1) otherwise type (2): '
    add_genre = validate_input(message, ->(input) do %w[1 2].include?(input) end)
    genre_name = nil
    genre_name = validate_input('Enter genre name: ') if add_genre == '1'

    true_inputs = %w[yes no y n]
    {
      'publish_date' => publish_date,
      'on_spotify' => true_inputs.include?(on_spotify.downcase),
      'genre_name' => genre_name
    }
  end

  def print_data(data)
    data.each do |obj|
      message = ''

      obj.each do |key, value|
        message += "#{key}: #{value}, " unless value.nil?
      end

      puts message
    end
  end
end
