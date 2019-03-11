def leave_review(parent)
  list = my_closed_positions(parent)
  review_menu = $prompt.select("Choose a position from the following list (removing a position with a caregiver will remove that caregiver from your service):") do | menu |
      menu.enum "."
        list.each_with_index do | position, index |
          menu.choice position.title, position.id
        end
        menu.choice "Main Menu"
  end
  if review_menu == "Main Menu"
      parent_menu_choice(parent)
  end

  selected_position = Position.find(review_menu)
      puts selected_position.title
      puts selected_position.working_hours
      puts selected_position.compensation
      puts " "
    final_selection = $prompt.select("Would you like to review this position?") do |menu|
      menu.choice "Yes"
      menu.choice "No"
    end
    if final_selection == "Yes"
      star_rating = $prompt.select("In a rating, 1-5, how would you rate this caregivers performance?", convert: :int) do |menu|
        menu.choice "1"
        menu.choice "2"
        menu.choice "3"
        menu.choice "4"
        menu.choice "5"
      end
        review_content = $prompt.ask("What comments would you like to leave about this caregiver?")
        selected_position.update(star_rating: star_rating, review: review_content)
      press_any_key()
      parent_menu_choice(parent)
    elsif final_selection == "No"
      review_listing(parent)
    end
  end
