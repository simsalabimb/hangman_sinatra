require 'sinatra'
require 'sinatra/reloader' if development? 
require './game_play.rb' #refactoring game

# https://github.com/Javier-Machin/hangman_app/blob/master/hangman.rb . Put everything into file, game method on hangman page
def secret_word
  file = File.open("dictionary.txt")
  file_data = file.readlines  

  find_word = true

  while find_word
      key = rand(file_data.length)
      word = file_data[key].gsub!("\n","")
    if word.length >= 5 && word.length <=12
      find_word = false
     return word.downcase
    end
  end
end

$word = secret_word
hangman = Game.new($word)

get '/' do

  blanks = hangman.display
  wrong = hangman.wrong
  wrong_guess = hangman.wrong_guess
  display = hangman.display_hangman
  count = hangman.count

  erb :index,
  :locals => {:word => $word, :blanks => blanks,:wrong_guess => wrong_guess, :wrong => wrong, :display => display, :count => count }
end

post '/letter' do
  letter = params["letter"]
  hangman.game(letter)
  blanks = hangman.display
  redirect '/'
end