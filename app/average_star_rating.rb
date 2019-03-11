def average_star_rating(caregiver)
    my_positions = Position.all.where(caregiver_id: caregiver.id)
    total = my_positions.map do |position|
      position.star_rating
    end
    if total == nil || my_positions = [] || my_positions == nil
      puts 'No Reviews!'
      press_any_key()
      menu_choice()
    else
    total.sum / total.length
  end
end

def average_star_rating_parent(caregiver)
    my_positions = Position.all.where(caregiver_id: caregiver)
    total = my_positions.map do |position|
      position.star_rating
    end
    if total == nil || my_positions = [] || my_positions == nil
      puts 'No Reviews!'
      press_any_key()
      menu_choice()
    else
    total.sum / total.length
end
end
