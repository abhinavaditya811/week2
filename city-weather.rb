require 'net/http'
require 'json'

def weather(city)
    params = {
    :access_key => "b808ebb6f18c229232a36ffc17b1af96",
    :query => city
    }
    uri = URI('https://api.weatherstack.com/current')
    uri.query = URI.encode_www_form(params)
    json = Net::HTTP.get(uri)
    api_response = JSON.parse(json)

    puts "Current temperature in #{api_response['location']['name']} is #{api_response['current']['temperature']}"

end

print "Which city's temp do you wanna check?"
city = gets.chomp

weather(city)