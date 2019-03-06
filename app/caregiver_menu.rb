$prompt = TTY::Prompt.new

      def caregiver_menu(caregiver)
        $prompt.select("Welcome Back, #{caregiver.name}, what would you like to do today?") do |menu|
            menu.choice 'Search Open Positions'
            menu.choice 'See Current Positions'
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
          end
        end
