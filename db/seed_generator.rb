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
