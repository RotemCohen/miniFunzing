User.reset_column_information
Activity.reset_column_information

paz, rotem = [
    {name: 'Paz', email: 'paz@gmail.com', password: '123456'},
    {name: 'Rotem', email: 'rotem@gmail.com', password: '654321'}
].map do |user_data|
  User.create user_data
end

[
    {title: 'Soccer Game', description: 'woohoo!',
     user: paz, max_attendees: 11, date: DateTime.now, ticket_cost: 1.0},
    {title: 'Beyonce Concert', description: 'You cannot miss this!',
     user: rotem, max_attendees: 100, date: DateTime.now, ticket_cost: 100.0},
    {title: 'Baking Course', description: 'You should come!',
     user: rotem, max_attendees: 20, date: DateTime.now, ticket_cost: 50.0},
    {title: 'Romeo And Juliet Show', description: 'You have to go!',
     user: rotem, max_attendees: 100, date: DateTime.now, ticket_cost: 50.0},
    {title: 'TDD Lecture', description: 'This is going to be fun!',
     user: paz, max_attendees: 5, date: DateTime.now, ticket_cost: 0.0}
].each do |activity_data|
  Activity.create activity_data
end