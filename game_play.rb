class Game
    @@counter = 0
    def initialize(word="word")
        @word = word
        @blanks = Array.new(@word.length - 1,"_")
        @wrong = []
        @result = []
        @wrong_guess = false
        @count = 9
    end

    def display
         @blanks
    end

    def count
       return  @count -=1 if @wrong_guess == true
        @count
    end

    def wrong_guess
        @wrong_guess
    end

    def wrong
        @wrong
    end

    def game(guess)
        @wrong_guess = false
        
        if  @wrong.length < 8 && @blanks.any?("_")
            i = 0
            while i < @word.length
                @word.each_char do |letter|
                    if letter == guess
                        @blanks[i] = guess
                    elsif @word.include?(guess) == false
                        @wrong_guess = true unless @wrong.include?(guess)
                        @wrong.push(guess) unless @wrong.include?(guess)
                    end
                    i+=1
                end
            end
        else 
            @blanks = final
            
        end
     @blanks
    end

    def final
        if @blanks.any?("_") == false
            return "You got it!"
        else
            return "Womp, womp. You lost! The word was #{@word}"
        end
    end

    def display_hangman
        num = @wrong.length
        if @wrong_guess == true
            case num
                when 1 then @result.push("____________")
                when 2 then @result.push("| /        |")
                when 3 then @result.push("|/         |")
                when 4 then @result.push("|          O")
                when 5 then @result.push("|          |")
                when 6 then @result.push("|         /|") 
                when 7 then @result.push("|         /|\\") 
                when 8 then @result.push("|         / ")
                when 9 then @result.push("|         / \\")
                else @result
            end
        end
        @result
    end

end
