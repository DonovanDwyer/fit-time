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



bench = Exercise.create(name: "Benchpress", form: "strength", part: nil, function: "Push", instructions: "Just do it, dummy.", time: 10)
squat = Exercise.create(name: "Squat", form: "strength", part: nil, function: "Legs", instructions: "Stand up.", time: 10)
curl = Exercise.create(name: "Bicep Curl", form: "hirep", part: nil, function: "Pull", instructions: "Touch face with metal. Repeat.", time: 5)
flies = Exercise.create(name: "Flies", form: "hirep", part: nil, function: "Push", instructions: "Just do it again.", time: 5)
incline_bench = Exercise.create(name: "Incline Bench", form: "hirep", part: nil, function: "Push", instructions: "Booyah.", time: 5)
hammer_curl = Exercise.create(name: "Hammer curl", form: "strength", part: nil, function: "Pull", instructions: "Touch face with metal. Repeat.", time: 5)
wide_curl = Exercise.create(name: "Wide bar curl", form: "hirep", part: nil, function: "Pull", instructions: "curl up and down with bar", time: 5)
lunges = Exercise.create(name: "Lunges", form: "hirep", part: nil, function: "Legs", instructions: "one leg up and one leg down", time: 10)
push_up = Exercise.create(name: "Push ups", form: "hirep", part: nil, function: "Push", instructions: "push up and down", time: 5)
shoulder_presh = Exercise.create(name: "Shoulder press", form: "strength", part: nil, function: "Push", instructions: "push it up and down", time: 5)
side_raises = Exercise.create(name: "Side raises", form: "hirep", part: nil, function: "Push", instructions: "lift the db on the side", time: 5)
incline_flies = Exercise.create(name: "Incline flies", form: "hirep", part: nil, function: "Push", instructions: "incline bench flies", time: 5)
lat_pull_down = Exercise.create(name: "Lat Pull Down", form: "strength", part: nil, function: "Pull", instructions: "lat pull down machine", time: 10)
dead_lift = Exercise.create(name: "Dead Lift", form: "strength", part: nil, function: "Pull", instructions: "Lift to ground and up with bar", time: 10)
pull_up = Exercise.create(name: "Pull ups", form: "hirep", part: nil, function: "Pull", instructions: "pull up and down", time: 5)
jumping_jacks = Exercise.create(name: "Jumping Jacks", form: "hirep", part: nil, function: "Pull", instructions: "jump up and down", time: 5)



WorkoutJoin.create(workout: hiit, exercise: bench)
WorkoutJoin.create(workout: hiit, exercise: squat)
WorkoutJoin.create(workout: hiit, exercise: curl)
WorkoutJoin.create(workout: hiit, exercise: curl)
