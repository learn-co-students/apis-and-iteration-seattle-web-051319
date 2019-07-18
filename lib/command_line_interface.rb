def welcome
  puts "Hello There!"
end

def get_character_from_user
  puts "please enter a character name"
  character_name = gets
  return character_name.downcase
end
