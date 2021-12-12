require "tty-prompt"

# Global Variable for tty-prompt
$prompt = TTY::Prompt.new 

def clear()
    # This method clear the terminal.

    if Gem.win_platform?
        system "cls"
    else
        system "clear"
    end 
end

def get_name()
    # This method gets name from the user.

    puts "Please enter your name (must be in characters):"
    name = $stdin.gets.chomp

    if !(name.strip.length <= 10) || name.length == 0
        raise "Your name is invalid!"
    end
    clear
    return name
end 


# App Launch with welcoming message
puts "Welcome to Mr.Pizza!!!"

def select_store()
    answer = $prompt.select("Welcome #{get_name}!!! Please select your nearest pizza store!", ["Carindale", "Chemside", "Southbank", "Calamvale", "Exit"])
    return answer
end

option = ""
while option != "Exit"
    # invokes the menu and stores the option in the variable 
    option = select_store
    # case statement to handle the options of the menu
    case option 
        when "Carindale"
            puts "Carindale pizza store"
            next
        when "Chermside"
            puts "Chermside store"
        when "Southbank"
            puts "Southbank Store"
        when "Calamvale"
            puts "Calamvale Store"
        else
            puts "See you next time.. #{name}!!"
            next
    end
    clear      
end

