def application_process
  positions = Position.all.select {|position| position.position_filled == false}
  position_menu = $prompt.select("Choose a position from the following list:") do | menu |
      menu.enum "."
        positions.each_with_index do | position, index |
          menu.choice position.title, position.id
        end
        menu.choice "Main Menu"
      end
    end
