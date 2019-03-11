Application.destroy_all
Caregiver.destroy_all
Parent.destroy_all
Position.destroy_all


cory = Parent.create(username: 'zepher2211', password: 'password', name: 'Cory')
cary = Parent.create(username: 'cary', password: 'password', name: 'Cary')
cody = Parent.create(username: 'cody', password: 'password', name: 'Cody')
josie = Caregiver.create(username: 'josie', password: 'password', name: 'Josie', years_of_experience: 3)
olivia = Caregiver.create(username: 'olivia', password: 'password', name: 'Olivia', years_of_experience: 1)
jessica = Caregiver.create(username: 'jessica', password: 'password', name: 'Josie', years_of_experience: 2)
full_time = Position.create(parent_id: cory.id, title: 'Full Time Position', requirements: 'Must be good with children.', duration: 'two months', working_hours: '8-5', compensation: '$15/h', position_filled: false)
part_time = Position.create(parent_id: cary.id, title: 'Part Time Position', requirements: 'No criminal record, passes drug test, two years of experience.', duration: 'one month', working_hours: '5-7 A.M.', compensation: '$12/h', position_filled: false)
hybrid_time = Position.create(parent_id: cody.id, title: 'Hybrid Position', requirements: 'Must be avqailable on call.', duration: 'five months', working_hours: '5-8 P.M.', compensation: '$10/h', position_filled: false)
josie_app = Application.create(position_id: part_time.id, caregiver_id: josie.id, content: 'Extremely experienced babysitter with a calm demeanor and experience with children.')
olivia_app = Application.create(position_id: full_time.id, caregiver_id: olivia.id, content: 'Extremely experienced babysitter with a calm demeanor and experience with children.')
jessica_app = Application.create(position_id: hybrid_time.id, caregiver_id: jessica.id, content: 'Extremely experienced babysitter with a calm demeanor and experience with children.')
