# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


john = User.create(name: "John", password_digest: "xyz")
bill = User.create(name: "Bill", password_digest: "xyz")
cohen = User.create(name: "Cohen", password_digest: "xyz")

hiit = Workout.create(user: john, description: "  ", name: "Hi Intensity", rating: 1, total_time: 30)



bench = Exercise.create(name: "Benchpress", form: "Strength", part: nil, function: "Push", instructions: "Just do it, dummy.", time: 10)
squat = Exercise.create(name: "Squat", form: "Strength", part: nil, function: "Legs", instructions: "Stand up.", time: 10)
curl = Exercise.create(name: "Bicep Curl", form: "Hi-Rep", part: nil, function: "Pull", instructions: "Touch face with metal. Repeat.", time: 5)

WorkoutJoin.create(workout: hiit, exercise: bench)
WorkoutJoin.create(workout: hiit, exercise: squat)
WorkoutJoin.create(workout: hiit, exercise: curl)
WorkoutJoin.create(workout: hiit, exercise: curl)
