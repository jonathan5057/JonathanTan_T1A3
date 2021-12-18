# def gets_time_after(seconds: 900)
#     # Prints actual time for the next 15 minutes

#     Time.now + seconds
#     # set time to next 15 minutes (900 seconds)
# end

# def format_time(time, format: '%I:%M%p')
#     time.strftime(format)
# end     

# Separted this function from my main.rb for the purpose of testing

def invalid_name(name)
    name.length > 10 || name.length == 0 || name.match(/[^A-Za-z]/)
end