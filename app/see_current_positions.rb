def see_current_positions(caregiver)
    my_positions = Position.all.select {|position| position.caregiver_id == caregiver.id && position.position_filled == true}
    my_positions.each do |position|
      puts position.title
      puts "hours: #{position.working_hours}"
      puts "hourly rate: #{position.compensation}"
      puts " "
    end
    press_any_key()
    caregiver_menu_choice(caregiver)
end
