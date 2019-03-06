

    def parent_menu(parent)
        $prompt.select("Welcome Back, #{parent.name}, what would you like to do today?") do |menu|
            menu.choice "Create Position"
            menu.choice 'Review Positions'
          end
    end

    def parent_menu_choice(parent)
      puts "\e[H\e[2J"
      
      case parent_menu(parent)
      when "Create Position"
          create_position()
          Position.last.parent_id = parent.id
          new_position = Position.last
          puts "#{new_position} Succesfully Created."
          press_any_key()
          parent_menu_choice(parent)
          nil
        end
      end
