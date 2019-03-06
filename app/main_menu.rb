$prompt = TTY::Prompt.new

  def menu
    $prompt.select("Menu") do |menu|
        menu.choice 'Login'
        menu.choice 'Create Parent Account'
        menu.choice 'Create Caregiver Account'
        menu.choice 'Exit'
      end
    end

    def menu_choice
      case menu
      when "Login"
          login()
      when "Create Parent Account"
          create_parent_account()
      when "Create Caregiver Account"
          create_caregiver_account()
      when "Exit"
          exit!
      end
    end
