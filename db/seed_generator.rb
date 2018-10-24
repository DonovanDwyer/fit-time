Exercise.destroy_all
Image.destroy_all


def seed_maker(ex_id)
  push_arr = [88, 83, 192, 97, 100, 163, 168, 101, 119, 233, 229, 123, 98, 260, 145, 338, 211, 82, 360, 394, 237]
  pull_arr = [129, 74, 81, 86, 193, 109, 105, 128, 143, 107, 106, 341, 138, 305, 205, 208, 181, 340, 202, 278, 424]
  leg_arr = [113, 154, 111, 249, 396, 300, 346, 308, 104, 103, 102, 185, 115, 355, 130, 114, 387]


  origin_address = 'https://wger.de/api/v2/exercise/' + "#{ex_id}" + '/?format=json'
  origin_response = RestClient::Request.execute(method: :get, url: origin_address, headers: {api_key: '77d0e5ae08d79e0c0e24cf22bc99ff5a4392b152'})
  returned_origin = JSON.parse(origin_response)
  @name = returned_origin["name"]
  @instructions = returned_origin["description"]

  info_address = 'https://wger.de/api/v2/exerciseinfo/' + "#{ex_id}" + '/?format=json'
  info_response = RestClient::Request.execute(method: :get, url: info_address, headers: {api_key: '77d0e5ae08d79e0c0e24cf22bc99ff5a4392b152'})
  returned_info = JSON.parse(info_response)
  @body_part = returned_info["category"]["name"] unless returned_info["category"]["name"].nil?
  @musc_one = returned_info["muscles"][0]["name"] unless returned_info["muscles"].empty?
  @musc_two = returned_info["muscles_secondary"][0]["name"] unless returned_info["muscles_secondary"].empty?
  @equip = returned_info["equipment"][0]["name"] unless returned_info["equipment"].empty?

  comment_address = 'https://wger.de/api/v2/exercisecomment/?format=json&exercise=' + "#{ex_id}"
  comment_response = RestClient::Request.execute(method: :get, url: comment_address, headers: {api_key: '77d0e5ae08d79e0c0e24cf22bc99ff5a4392b152'})
  returned_comment = JSON.parse(comment_response)
  @comments = ""
  if returned_comment["results"] != nil
    returned_comment["results"].each do |comment|
      @comments +=  "<li>#{comment["comment"]}</li>"
    end
  end

  if push_arr.include?(ex_id)
    @function = "push"
  elsif pull_arr.include?(ex_id)
    @function = "pull"
  else
    @function = "legs"
  end

 @excercise = Exercise.create(function: @function, time: 5, name: @name, instructions: @instructions, body_part: @body_part, muscle_one: @musc_one, muscle_two: @musc_two, equipment: @equip, comment: @comments)

  image_address = 'https://wger.de/api/v2/exerciseimage/?format=json&exercise=' + "#{ex_id}"
  image_response = RestClient::Request.execute(method: :get, url: image_address, headers: {api_key: '77d0e5ae08d79e0c0e24cf22bc99ff5a4392b152'})
  returned_image = JSON.parse(image_response)
  if !returned_image['results'].empty?
    returned_image["results"].each do |image|
      Image.create(exercise: @excercise, image_url: image["image"])
    end
  end

end

ex_arr = [88, 83, 192, 97, 100, 163, 168, 101, 119, 233, 229, 123, 98, 260, 145, 338, 211, 82, 360, 394, 237, 164, 129, 74, 81, 86, 193, 109, 105, 128, 143, 107, 106, 341, 138, 305, 205, 208, 181, 340, 202, 278, 424, 113, 154, 111, 249, 396, 300, 346, 308, 104, 103, 102, 185, 115, 355, 130, 114, 387]

ex_arr.each do |ex|
  seed_maker(ex)
end

arr = ["strength", "hirep"]
Exercise.all.map {|x| x.update(form: arr.sample)}


Image.create(image_url: "https://gogoodguru.com/wp-content/uploads/2017/05/Incline-Pushups.png", exercise_id: 7 )
Image.create(image_url: "https://www.freeworkoutlog.com/images/exercises/1288-1_275x275.png", exercise_id: 8 )
Image.create(image_url: "https://climbingtogetherandotherfunadventures.files.wordpress.com/2014/01/front-raises-man.jpg", exercise_id: 10)
Image.create(image_url: "http://entrenadorpersonalpamplona.net/wp-content/uploads/2016/08/press-militar-de-pie.jpg", exercise_id: 11)
Image.create(image_url: "http://www.gymworkoutchart.com/wp-content/uploads/2017/04/Decline-Pushup.jpg", exercise_id: 14)
Image.create(image_url: "https://i2.wp.com/www.idfa.ca/wp-content/uploads/2013/01/dumbell-flys.jpg", exercise_id: 15 )
Image.create(image_url: "https://forkf.com/wp-content/uploads/2017/11/The-7-Workout-To-Burn-Belly-Pooch-Windshield-Wipers-Exercises.jpg", exercise_id: 16)
Image.create(image_url: "http://dittræningsprogram.dk/wp-content/uploads/2013/12/bench-press-2-1.png", exercise_id: 17)
Image.create(image_url: "https://upload.wikimedia.org/wikipedia/commons/9/94/Bench-press-2-2.png", exercise_id: 17)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Gymastic_Ring_Dips.png", exercise_id: 19)
Image.create(image_url: "http://www.lifteatrepeat.co/wp-content/uploads/2017/08/lift-eat-repeat-face-pulls.png", exercise_id: 20)
Image.create(image_url: "https://www.vitalsupp.com/wp-content/uploads/2016/09/Screen-Shot-2016-09-12-at-9.38.52-PM.png", exercise_id: 21)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Barbell_High_Pull-1.png", exercise_id: 22)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Barbell_Deadlift.png", exercise_id: 29)
Image.create(image_url: "http://billmarnich.com/wp-content/uploads/2017/03/pull-ups.jpg", exercise_id: 32)
Image.create(image_url: "http://entrenamiento.site/wp-content/uploads/2018/09/complex-en-anillas.jpg", exercise_id: 34)
Image.create(image_url: "http://fitnessstars.weebly.com/uploads/5/8/8/7/58879495/9664824_orig.jpg", exercise_id: 36)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/One_Arm_Dumbbell_Preacher_Curl_F_WorkoutLabs.png", exercise_id: 37 )
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Reverse_Grip_EZ_Bar_Curl1.png", exercise_id: 38)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Dumbbell_Incline_Row1.png", exercise_id: 40)
Image.create(image_url: "https://adamwinterlifestyle.com/wp-content/uploads/2017/05/Bent-Over-Barbell-Rows.jpg", exercise_id: 41)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Dumbbell_Side_Bend1.png", exercise_id: 42)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/V-Bar_Triangle_Bar_Lat_Pull_Downs.png", exercise_id: 43)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Two-Arm_Kettlebell_Swing.png", exercise_id: 47)
Image.create(image_url: "https://www.exercisegoals.com/images/thrusters-exercise.jpg", exercise_id: 48)
Image.create(image_url: "https://static1.squarespace.com/static/590a5ba12994caa0d30916a1/t/590a5f725fd63b814be7a406/1493853043279/Image-369.jpg", exercise_id: 49)
Image.create(image_url: "https://media.golfdigest.com/photos/58b86fc10f2afe1ba851c468/master/w_768/strength-exercises-bulgarian-split-squat.jpg", exercise_id: 50 )
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Calf_Raises_on_Leg_Press_MachineCalf_Raises_on_Leg_Press_Machine.png", exercise_id: 51)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Machine_Hack_Squat.png", exercise_id: 52)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Seated_Calf_Raise.png", exercise_id: 53)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Standing_Dumbbell_Calf_Raise.png", exercise_id: 54)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Side_to_Side_Jump_Squat_F_WorkoutLabs.png", exercise_id: 55)
Image.create(image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8GhAVA6LSu4vJioG2cbkYApyHC_jyPE99giIcbbM_0wzi9HW4", exercise_id: 56)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Barbell_Overhead_Squats.png", exercise_id: 57)
Image.create(image_url: "http://fitnessstars.weebly.com/uploads/5/8/8/7/58879495/8042364_orig.png", exercise_id: 59)
Image.create(image_url: "https://cdn-xi3mbccdkztvoept8hl.netdna-ssl.com/wp-content/uploads/watermarked/Wall_Sit_squat_M_WorkoutLabs.png", exercise_id: 60)
