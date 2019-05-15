#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def welcome
  puts "Welcome, User"
end

def get_character_from_user
  puts "Please enter character name:"
  gets.chomp
end

welcome
character = get_character_from_user
show_character_movies(character)
