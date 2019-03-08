$prompt = TTY::Prompt.new

      def caregiver_menu(caregiver)
        $prompt.select("Welcome Back, #{caregiver.name}, what would you like to do today?") do |menu|
            menu.choice 'Search Open Positions'
            menu.choice 'Apply to Positions'
            menu.choice 'See Current Positions'
            menu.choice 'Return to Main Menu'
          end
        end

      def caregiver_menu_choice(caregiver)
        puts "\e[H\e[2J"

        case caregiver_menu(caregiver)
          when "Search Open Positions"
            positions = Position.all.select {|position| position.position_filled == false}
            puts "#{positions}"
            press_any_key()
            caregiver_menu_choice(caregiver)
          when "Apply to Positions"
              position = application_process()
              content = $prompt.ask("What would you like the employer to know about you?")
              new_app = Application.create(content: content, position_id: position, caregiver_id: caregiver.id)
              puts "#{new_app} Successfully Created."
              press_any_key()
              caregiver_menu_choice(caregiver)
          when "See Current Positions"
            see_current_positions(caregiver)
          when "Return to Main Menu"
            menu_choice()
     end
  end
