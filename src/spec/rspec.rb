require 'rspec'
#require_relative '../main.rb'
require_relative '../menu.rb'
require_relative '../user_name.rb'


describe "invalid name" do
    it "should return true longer than 10" do
        expect(invalid_name("test_johnuser")).to eq(true)
    end
    
    it "should return true if blank" do
        expect(invalid_name("")).to eq(true)
    end

    it "should return true if contains digit" do
        expect(invalid_name("test_john123")).to eq(true)
    end
end

# describe "get_time_after" do
#     it "should the time later than current time by 900 seconds (default)" do
#         t = Time.now + 900
#         time_diff = gets_time_after - t
#         expect(time_diff.abs).to be_between(0,2)
#     end
# end

# describe "format_time" do
#     it "should return expected default format" do
#         current_time = Time.now
#         expect(format_time(current_time)).to eq(current_time.strftime('%I:%M%p'))
#     end
# end

describe "menu" do
    it "should return available menu" do
        expect(FOOD_LIST).to match({
            "Hawaiian Pizza" => 5.00,
            "BBQ Cheeseburger Pizza" => 8.95,
            "Mega Meatlover Pizza" => 8.95,
            "Peri Peri Chicken Pizza" => 7.95,
            "Peperoni Pizza" => 10.00,
            "Chicken Tikamasala" => 8.95,
            "Double Bacon Pizza" => 12.95,
            "Chicken Supreme Pizza" => 13.00
        })
    end
end