Shoes.app do
  def answer(message)
    @results.prepend { para(message) }
  end

  limit = 20
  magic_number = rand limit
  tries = 0
  para 'guess the number'
  guess = edit_line
  button 'go' do
    number = guess.text.to_i
    tries = tries + 1
    difference = (magic_number - number).abs
    if number == magic_number
      @results.prepend do
        button 'start over' do
          tries = 0
          magic_number = rand limit
          @results.clear
        end
      end
      answer "hey, you guessed #{number} in #{tries} tries :)"
    elsif number > limit
      answer "too high!"
    elsif number < 1
      answer "too low!"
    elsif difference == 1
      answer "#{number} is HOT"
    elsif difference >= 5
      answer "#{number} is COLD"
    else
      answer "#{number} was a nice try :("
    end
  end

  @results = stack
end