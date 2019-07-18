require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  
  results = response_hash["results"]
  films = []
  
  results.each do |result|
    if result["name"].downcase == character_name.chomp
      films = result["films"]
    end
  end
  
  film_titles = []
  films.each do |film|
    film_response = RestClient.get(film)
    film_response_hash = JSON.parse(film_response)
    film_titles << film_response_hash["title"]
  end
  
  return film_titles
end

def print_movies(films)
  count = 1
  films.each do |film|
    puts "#{count} #{film}"
    count += 1
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
