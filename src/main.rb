require "tty-prompt"

# Global Variable assigned for tty-prompt
$prompt = TTY::Prompt.new 

# App Launch with welcoming message
puts "Welcome to Mr.Pizza!!!"

# def initialise()
#     @Category = {}
#     @food = {}
#     @prie = {}
# end

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

def select_store()
    # This method gets the selected store from the user. 
    
    answer = $prompt.select("Welcome #{get_name}!!! Please select your nearest pizza store!", ["Carindale", "Chemside", "Calamvale", "Exit"])
    return answer
end

def print_selection()
    # This method prints the main menu of the system. 
    
    selection = $prompt.select("Please select option!", ["ADD ORDER", "REMOVE ORDER", "SHOW DETAILS", "EXIT"])
    return selection
end

def add_order()
    # This method print the food menu and gets items from user.

end

def remove_order()
    # This method delete item from the menu list

end

def show_detail()
    # This method returns the full ordering list 
    
end

option = ""
while option != "Exit"
    # invokes the menu and stores the option in the variable 
    option = select_store
    # case statement to handle the options of the menu
    case option 
        when "Carindale"
            clear
            puts "Welcome to your local Carindale Pizza Store!"
            print_selection
        when "Chermside"
            clear
            puts "Welcome to your local Chemside Pizza Store!"
            print_selection
        when "Calamvale"
            clear
            puts "Welcome to your local Calamvale Pizza Store!"
            print_selection
        else
            puts "See you next time.. #{name}!!"
            break
            
    end
    clear      
end

