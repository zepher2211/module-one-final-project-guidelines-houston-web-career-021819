

    def parent_menu(parent)
        $prompt.select("Welcome Back, #{parent.name}, what would you like to do today?") do |menu|
            menu.choice 'Create Position'
            menu.choice 'Review Positions'
            menu.choice 'Review Current Caregivers'
            menu.choice 'Return to Main Menu'
          end
    end

    def parent_menu_choice(parent)
      puts "\e[H\e[2J"

      case parent_menu(parent)
      when "Create Position"
          create_position()
          new_position = Position.last
          new_position.update(parent_id: parent.id)
          puts "#{new_position} Succesfully Created."
          press_any_key()
          parent_menu_choice(parent)
      when 'Review Current Caregivers'
          my_positions =  Position.all.select {|position| position.parent_id == parent.id}
          my_filled_positions = my_positions.select {|position| position.position_filled == true}
          caregiver_id_var = my_filled_positions.map {|position| position.caregiver_id}
          Caregiver.find(caregiver_id_var).each do |object|
            puts "Name: #{object.name}"
            puts "Years of Experience: #{object.years_of_experience}"
            star_rating = average_star_rating(object)
            puts "Star Rating: #{star_rating}"
            puts " "
          end
          press_any_key()
          parent_menu_choice(parent)
      when "Return to Main Menu"
          menu_choice()
      when 'Review Positions'
          option = $prompt.select("Choose an Option") do |menu|
          #      menu.choice 'See Filled Positions'
          menu.choice 'See Open Positions'
          menu.choice 'Hire Caregiver'
          menu.choice 'Leave Review'
          menu.choice 'Remove Listing'
        end
            if option == "Hire Caregiver"
              hire_caregiver(parent)
            elsif option == "See Open Positions"
              my_positions = my_open_positions(parent)
              my_positions.each do |position|
                puts position.title
                puts position.working_hours
                puts position.compensation
                puts " "
                press_any_key()
                parent_menu_choice(parent)
              end
            elsif option == "Remove Listing"
                remove_listing(parent)
            elsif option == "Leave Review"
              leave_review(parent)
            end
          end
        end
