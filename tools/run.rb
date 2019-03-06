require_relative '../config/environment'
require 'tty'
require_all 'app'

$prompt = TTY::Prompt.new

    puts "\e[H\e[2J"
    menu_choice()
