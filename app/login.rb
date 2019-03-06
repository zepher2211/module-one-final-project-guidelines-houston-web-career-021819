 $prompt = TTY::Prompt.new


  def login()
    username = $prompt.ask('Username')
    password = $prompt.mask('Password')

    p_or_c = $prompt.select("Are you a Parent or a Caregiver?") do |menu|
        menu.choice 'Parent'
        menu.choice 'Caregiver'
      end
    if p_or_c == "Parent"
        parent = Parent.find_by username: username, password: password
        parent_menu_choice(parent)
    elsif p_or_c == "Caregiver"
        caregiver = Caregiver.find_by username: username, password: password
        caregiver_menu_choice(caregiver)
    else
        exit
    end
  end
