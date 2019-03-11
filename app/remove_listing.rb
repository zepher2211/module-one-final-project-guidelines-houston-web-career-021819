def remove_listing(parent)
    list = my_positions(parent)
    remove_menu = $prompt.select("Choose a position from the following list (removing a position with a caregiver will remove that caregiver from your service):") do | menu |
        menu.enum "."
          list.each_with_index do | position, index |
            menu.choice position.title, position.id
          end
          menu.choice "Main Menu"
    end
    if remove_menu == "Main Menu"
        parent_menu_choice(parent)
    end
    selected_position = Position.find(remove_menu)
      puts selected_position.attributes
      final_selection = $prompt.select("Would you like to remove this position?") do |menu|
        menu.choice "Yes"
        menu.choice "No"
      end
      if final_selection == "Yes"
        puts "#{selected_position.title} will be removed."
        selected_position.destroy
        press_any_key()
        parent_menu_choice(parent)
      elsif final_selection == "No"
        remove_listing(parent)
      end
end
