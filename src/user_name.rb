 # Separted this method from my main.rb for the purpose of testing
 # To test the user input name

def invalid_name(name)
    name.length > 10 || name.length == 0 || name.match(/[^A-Za-z]/)
end