def create_parent_account()
  username = $prompt.ask('Please Input a Username')

  password = $prompt.mask('What Would You Like Your Password to Be?')

  confirm_password = $prompt.mask('Confirm Password')
  if confirm_password == password
    name = $prompt.ask('What is Your Name?')
    Parent.create(username: username, password: password, name: name)
    menu_choice()
  else
    puts 'Your passwords do not match!'
  end
end

def create_caregiver_account()
  username = $prompt.ask('Please Input a Username')

  password = $prompt.mask('What Would You Like Your Password to Be?')

  confirm_password = $prompt.mask('Confirm Password')
  if confirm_password == password
    name = $prompt.ask('What is Your Name?')

    years = $prompt.ask('How Many Year of Experience Do You Have?', convert: :int)
    Caregiver.create(username: username, password: password, name: name, years_of_experience: years)
    menu_choice()
  else
    puts 'Your passwords do not match!'
  end
end
