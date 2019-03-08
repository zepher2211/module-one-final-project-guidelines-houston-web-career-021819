require_relative '../config/environment'
require 'tty'
require 'pry'
require_all 'app'

$prompt = TTY::Prompt.new
#    binding.pry
    puts "\e[H\e[2J"
    menu_choice()
