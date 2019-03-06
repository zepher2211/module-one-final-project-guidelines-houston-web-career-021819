Application.destroy_all
Caregiver.destroy_all
Parent.destroy_all
Position.destroy_all


cory = Parent.create(username: nil, password: nil, name: 'Cory')
josie = Caregiver.create(username: nil, password: nil, name: 'Josie', years_of_experience: 3)
part_time = Position.create(parent_id: cory.id, title: 'Part Time Position', requirements: 'buff af', duration: 'two months', working_hours: '8-5', compensation: '$15/h', position_filled: false)
josie_app = Application.create(position_id: part_time.id, caregiver_id: josie.id, content: 'Extremely experienced babysitter with a calm demeanor and experience with children.')
