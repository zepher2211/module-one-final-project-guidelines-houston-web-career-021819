def list_reviews(caregiver)
  my_positions = Position.all.where(caregiver_id: caregiver)
  my_positions.each do |position|
    puts " "
    puts "#{position.title}: #{position.review}"
    puts " "
  end
end
