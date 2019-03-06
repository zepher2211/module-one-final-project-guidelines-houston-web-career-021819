# $prompt = TTY::Prompt.new

def create_position
  title = $prompt.ask('What is the title of your position?')
  requirements = $prompt.ask('What are the requirements for this position?')
  duration = $prompt.ask('Approximately how long will the applicant work in this position?')
  hours = $prompt.ask('What are the working hours in this position?')
  comp = $prompt.ask('How much will the caregiver be compensated per hour?')
  Position.create(title: title, requirements: requirements, duration: duration, working_hours: hours, compensation: comp)
end
