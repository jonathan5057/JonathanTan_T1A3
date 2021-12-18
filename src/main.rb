require "tty-prompt"
require "tty-table"
require "colorize"
require "artii"

require_relative "./menu.rb"

# Global Variable assigned for tty-prompt
$prompt = TTY::Prompt.new 

# App Launch with welcoming message
a = Artii::Base.new :font => 'slant'
puts a.asciify('Welcome To Pizza Boss!')
puts "Welcome to Pizza Boss!!!".red

def clear()
    # This method clear the terminal.

    if Gem.win_platform?
        system "cls"
    else    
        system "clear"
    end 
end

def get_name()
    # This method gets name from the user and convert into capitalize

    puts "Please enter only your first name (must be less than 11 characters, no numeric and special characters):"
    name = $stdin.gets.chomp.capitalize.strip 
 
    if name.length > 10 || name.length == 0 || name.match(/[^A-Za-z]/)
        raise "Your name is invalid! Please run the program again."
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
    # This method prints the main menu of the system and return the results. 
    confirmed_orders = []
        
    while true
        selection = $prompt.select("Please select option!", ["ADD ORDER", "REMOVE ORDER", "SHOW DETAILS", "FINALIZED ORDER", "EXIT"])
        
        case selection
        when 'ADD ORDER'
            clear
            confirmed_orders << add_order()
            selection
        when 'SHOW DETAILS'
            clear
            show_order(confirmed_orders)
            selection
        when 'REMOVE ORDER'
            clear
            remove_order(confirmed_orders).each do |order|
                puts order
                confirmed_orders.delete_at(order)
            end
            selection
        when "FINALIZED ORDER"
            clear        
            total = confirmed_orders.map{|order| order[1]}.sum        
            puts "Here is your total bill: $#{total}".red
            select_delivery
        else
            exit
        end
    end
end

def select_delivery
    # This method prompt the menu for delivery option

    delivery = $prompt.select("Please select your order type!", ["PICK UP", "DELIVERY"])
    
    case delivery
    when "PICK UP"
        clear
        puts "Your order will be ready in next 15 minutes at #{gets_time}.".green
        puts "Please pick at your local store".yellow
        b = Artii::Base.new :font => 'slant'
        puts b.asciify('THANK YOU!')
        exit
    else "DELIVERY"
        clear 
        puts "Your order is being prepared and will be deliver to #{get_address}."
        puts "Thank you for shopping with us. See you next time!"
        b = Artii::Base.new :font => 'slant'
        puts b.asciify('THANK YOU!')
        exit 
    end
end

def get_address()
    # This method gets delivery address from the user.

    puts "Please enter your address!".green
    print "Enter Your Street Number: ".yellow
    number = gets.chomp
    print "Enter Your Street Name: ".yellow
    street = gets.chomp.capitalize
    print "Enter Your Surburt Name: ".yellow
    suburt = gets.chomp.capitalize
    print "Enter Your Postcode: ".yellow
    postcode = gets.chomp
    clear
    return "#{number} #{street} #{suburt} QLD #{postcode}"
end 

def gets_time()
    # Prints actual time for the next 15 minutes

    t = Time.now + 900 # set time to next 15 minutes (900 seconds)
    time = t.strftime('%I:%M%p')
    return time
end

def add_order()
    # This method print the food menu and gets items from user.

    selected_food = $prompt.select("Please select option!".yellow, FOOD_LIST.keys)
    [selected_food, FOOD_LIST[selected_food]]
end

def remove_order(orders)
    # This method delete item from the menu list

    count = 0
    choices = orders.reduce({}) do |result, order|
        result["#{order}-#{count}"] = count
        count +=1

        result
    end
    $prompt.multi_select("Select order to remove? (Space Bar to select and ENTER once confirm: ", choices)
end

def show_order(orders)
    # This method returns the full ordering list 

    table = TTY::Table.new(["food","price"], orders)
    puts table.render(:ascii)
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
        when "Chemside"
            clear
            puts "Welcome to your local Chemside Pizza Store!"
            print_selection
        when "Calamvale"
            clear
            puts "Welcome to your local Calamvale Pizza Store!"
            print_selection
        else
            puts "See you next time.. !!"
            break       
    end
    clear      
end

