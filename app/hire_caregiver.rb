def hire_caregiver(parent)
  open_positions = my_open_positions(parent)
  open_positions.map {|position| position.caregiver_id}
  #binding.pry
  position_menu = $prompt.select("Choose a position from the following list:") do | menu |
      menu.enum "."
        open_positions.each do | position |
          menu.choice position.title, position.id
        end
          menu.choice "Main Menu"
    end
#    binding.pry
    if position_menu == "Main Menu"
        parent_menu_choice(parent)
    end
    position = Position.find(position_menu)
    if position.applications == []
      puts "No applications!"
      press_any_key()
      parent_menu_choice(parent)
    else
    selected_applicant = $prompt.select("Choose a caregiver from the following list:") do | menu |
        menu.enum "."
          position.applicants.each do | applicant |
            menu.choice applicant.name, applicant.id
          end
#          binding.pry
        end
        my_application = Application.find_by(caregiver_id: selected_applicant)
        puts "\e[H\e[2J"
        puts "This caregiver's application: #{my_application.content}"
        puts " "
        puts "Caregiver's Average Rating(1-5): #{average_star_rating_parent(selected_applicant)}"
        puts " "
        puts "These are reviews concerning this caregiver:"
        list_reviews(selected_applicant)

        confirm = $prompt.select("Would you like to confirm this application? (This will reject all other applications.)") do | menu |
              menu.choice "Yes"
              menu.choice "No"
            end
        if confirm == "Yes"
          position.caregiver_id = selected_applicant
          position.position_filled = true
          position.save
          Application.where(position_id: position_menu).destroy_all
        else
          hire_caregiver(parent)
      end
end
end
