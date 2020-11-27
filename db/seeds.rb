#<User id: nil, username: nil, email: nil, password: nil, created_at: nil, updated_at: nil>
user_list = [
    ["user1", "user1@shutterlogger.com", "123456", Time.now, Time.now],
    ["user2", "user2@shutterlogger.com", "234567", Time.now, Time.now],
    ["user3", "user3@shutterlogger.com", "3456789", Time.now, Time.now],
    ["user4", "user4@shutterlogger.com", "4567890", Time.now, Time.now],
    ["user5", "user5@shutterlogger.com", "5678901", Time.now, Time.now]
]

user_list.each do |username, email, password, created_at, updated_at|
    User.create(username: username, email: email, password: password, created_at: created_at, updated_at: updated_at)
end

#<Camera id: nil, nickname: nil, make: nil, model: nil, loaded: nil, user_id: nil, created_at: nil, updated_at: nil>
camera_list = [
    ["Little AE", "Canon", "AE-1", 0, 1, Time.now, Time.now],
    ["Gifted FM", "Nikon", "FM", 0, 1, Time.now, Time.now],
    ["Black Yashica", "Yashica", "G", 0, 2, Time.now, Time.now],
    ["Silver Yashica", "Yashica", "G", 0, 2, Time.now, Time.now],
    ["Black Nikon", "Nikon", "F90", 0, 3, Time.now, Time.now],
    ["Modern-ish Minolta", "Minolta", "Dynax 700si", 0, 4, Time.now, Time.now],
    ["Plastic Fantastic", "Minolta", "Maxxum 7000", 0, 4, Time.now, Time.now],
    ["My Oldest Camera", "Pentax", "Spotmatic SP", 0, 3, Time.now, Time.now],
    ["Little Petite", "Afga", "Optima 500", 0, 5, Time.now, Time.now],
    ["Untested Uni", "Uni", "Topcon", 0, 5, Time.now, Time.now]
]

camera_list.each do |nickname, make, model, loaded, user_id, created_at, updated_at|
    Camera.create(nickname: nickname, make: make, model: model, loaded: loaded, user_id: user_id, created_at: created_at, updated_at: updated_at)
end

#<Lens id: nil, make: nil, model: nil, focal_range: nil, max_aperture: nil, min_aperture: nil, camera_id: nil, user_id: nil, created_at: nil, updated_at: nil>
len_list = [
    ["Canon", "EF50", "50mm", "22", "1.4", 1, 1, Time.now, Time.now],
    ["Nikon", "Nikkor", "50mm", "19", "1.8", 2, 1, Time.now, Time.now],
    ["Yashica", "Yashinon", "42mm", "20", "2.0", 3, 2, Time.now, Time.now],
    ["Yashica", "Yashinon", "42mm", "20", "2.0", 4, 2, Time.now, Time.now],
    ["Nikon", "Nikkor", "28mm", "28", "2.8", 5, 3, Time.now, Time.now],
    ["Minolta", "Beercan", "70-200mm", "18", "4", 6, 4, Time.now, Time.now],
    ["Minolta", "EF50", "50mm", "20", "1.8", 6, 4, Time.now, Time.now],
    ["Minolta", "EF50", "35mm", "20", "2.8", 7, 4, Time.now, Time.now],
    ["Pentax", "EF50", "50mm", "22", "1.4", 8, 3, Time.now, Time.now],
    ["Agfa", "EF50", "50mm", "24", "2.0", 9, 5, Time.now, Time.now],
    ["Uni", "EF50", "50mm", "18", "2.0", 10, 5, Time.now, Time.now]
]

len_list.each do |make, model, focal_range, max_aperture, min_aperture, camera_id, user_id, created_at, updated_at|
    Len.create(make: make, model: model, focal_range: focal_range, max_aperture: max_aperture, min_aperture: min_aperture, camera_id: camera_id, user_id: user_id, created_at: created_at, updated_at: updated_at)
end

#<Roll id: nil, exp_count: nil, iso: nil, brand: nil, comments: nil, camera_id: nil, user_id: nil, created_at: nil, updated_at: nil>
roll_list = [
    [36, 400, "Kodak", "Portra", 1, 1, Time.now, Time.now],
    [36, 400, "Fujifilm", "Fujicolor PRO 400H", 2, 4, Time.now, Time.now],
    [36, 400, "Ilford", "HP5", 3, 2, Time.now, Time.now],
    [36, 800, "Lomography", "LomoChrome Purple XR", 4, 3, Time.now, Time.now],
    [36, 480, "Kodak", "Portra", 5, 5, Time.now, Time.now],
    [24, 100, "Kodak", "Ektar", 6, 6, Time.now, Time.now],
    [36, 800, "Cinestill", "800Tungsten Xpro C-41", 7, 7, Time.now, Time.now],
    [36, 400, "Fujifilm", "Fujicolor PRO 400H", 8, 10, Time.now, Time.now],
    [36, 400, "Ilford", "Delta 3200", 9, 9, Time.now, Time.now],
    [36, 400, "Kodak", "Ultramax 400", 10,8, Time.now, Time.now]
]

roll_list.each do |exp_count, iso, brand, comments, camera_id, user_id, created_at, updated_at|
    Roll.create(exp_count: exp_count, iso: iso, brand: brand, comments: comments, camera_id: camera_id, user_id: user_id, created_at: created_at, updated_at: updated_at)
end

#<Photo id: nil, name: nil, description: nil, shutter: nil, aperture: nil, focal_length: nil, date: nil, time: nil, location: nil, rating: nil, roll_id: nil, len_id: nil, camera_id: nil, user_id: nil, created_at: nil, updated_at: nil>
photo_list = [
    ["A walk in the park", "It was sunny", "1/1000", "8.0", "50mm", "Sunday, 23rd 2020", "11:35", "Doylestown, PA", 4, 1, 1, 1, 1, Time.now, Time.now],
    ["My friends", "Playing D&D", "1/400", "8.0", "50mm", "Monday, 23rd 2020", "11:35", "New Britain, PA", 2, 2, 2, 1, 1, Time.now, Time.now],
    ["Interesting Angle", "Old buildiong", "1", "8.0", "50mm", "Tuesday, 23rd 2020", "11:35", "Doylestown, PA", 1, 3, 3, 1, 1, Time.now, Time.now],
    ["Ava", "My cat sleeping", "1/320", "8.0", "50mm", "Wednesday, 23rd 2020", "11:35", "Bethlehem, PA", 5, 4, 4, 2, 2, Time.now, Time.now],
    ["Beautiful Sunset", "this kind happens like once a year", "1/200", "8.0", "50mm", "Thursday, 23rd 2020", "11:35", "Philadelphia, PA", 1, 5, 5, 2, 2, Time.now, Time.now],
    ["Museum visit", "guide wasn't great but lovely artifacts", "1/126", "8.0", "50mm", "Friday, 23rd 2020", "11:35", "Doylestown, PA", 2, 6, 6, 2, 2, Time.now, Time.now],
    ["Mountain view", "that day my legs almost gave up", "1/500", "8.0", "50mm", "Saturday, 23rd 2020", "11:35", "Doylestown, PA", 3, 7, 7, 3, 3, Time.now, Time.now],
    ["Rectilinear, not", "very non-euclidean of them", "1/1000", "8.0", "50mm", "Sunday, 23rd 2020", "11:35", "Doylestown, PA", 4, 8, 8, 3, 3, Time.now, Time.now],
    ["High Speed", "my car", "1/500", "8.0", "50mm", "Monday, 23rd 2020", "11:35", "NY, NY", 5, 1, 8, 3, Time.now, Time.now],
    ["Birdies", "don't know what kind, I'm not a bird watcher", "1/320", "8.0", "50mm", "Tuesday, 23rd 2020", "11:35", "Elizabeth, NJ", 2, 9, 3, 4, 4, Time.now, Time.now],
    ["Strange Rock", "looked like a donut", "1", "8.0", "50mm", "Wednesday, 23rd 2020", "11:35", "Newark, NJ", 1, 10, 4, 4, 4, Time.now, Time.now],
    ["A ufo??", "cigar kind", "4", "8.0", "50mm", "Sunday, 23rd 2020", "11:35", "Doylestown, PA", 4, 1, 4, Time.now, Time.now],
    ["Caught a ghost on camera!", "might be just dust", "1/1000", "8.0", "50mm", "Sunday, 23rd 2020", "11:35", "Doylestown, PA", 3, 1, 5, 5, 5, Time.now, Time.now],
    ["Nice vase", "dang it, almost hit it with the camera", "1/320", "8.0", "50mm", "Wednesday, 23rd 2020", "11:35", "Doylestown, PA", 3, 2, 6, 6, 6, Time.now, Time.now],
    ["My girfriend's candles", "the smelled super nice, except for one that smelled like diesel", "1/60", 8.0, "50mm", "Sunday, 23rd 2020", "11:35", "Doylestown, PA", 4, 3, 3, 7, 7, Time.now, Time.now],
    ["Silent night", "not even the crickets were out ", "1/20", "8.0", "50mm", "Thursday, 23rd 2020", "11:35", "Doylestown, PA", 5, 4, 1, 8, 8, Time.now, Time.now],
    ["Testing faulty shutter", "i thought I fixed it", "1/500", "8.0", "50mm", "Friday, 23rd 2020", "11:35", "Doylestown, PA", 4, 5, 2, 8, 9, Time.now, Time.now],
    ["Accidental photo", "Pressed shutter by accident", "1/80", "8.0", "50mm", "Sunday, 23rd 2020", "11:35", "Doylestown, PA", 5, 6, 5, 10, 10, Time.now, Time.now],
    ["Stray dog", "I almost took him home, but then I remembered my lease agreement", "1/100", "8.0", "50mm", "Saturday, 23rd 2020", "11:35", "Doylestown, PA", 4, 7, 4, 10, 10, Time.now, Time.now],
    ["My workplace", "quiet day at the shop", "1/100", "8.0", "50mm", "Sunday, 23rd 2020", "11:35", "Doylestown, PA", 5, 8, 8, 10, 10, Time.now, Time.now]

]

photo_list.each do |name, description, shutter, aperture, focal_length, date, time, location, rating, roll_id, len_id, camera_id, user_id, created_at, updated_at|
    Photo.create(name: name, description: description, shutter: shutter, aperture: aperture, focal_length: focal_length, date: date, time: time, location: location, rating: rating, roll_id: roll_id, len_id: len_id, camera_id: camera_id,user_id: user_id, created_at: created_at, updated_at: updated_at)
end

#<CameraPhotos id: nil, camera_id: nil, photo_id: nil, created_at: nil, updated_at: nil>
camera_photos_list = [
    [1, 1, Time.now, Time.now],
    [1, 2, Time.now, Time.now],
    [2, 3, Time.now, Time.now],
    [2, 4, Time.now, Time.now],
    [3, 5, Time.now, Time.now],
    [3, 6, Time.now, Time.now],
    [4, 7, Time.now, Time.now],
    [4, 8, Time.now, Time.now],
    [5, 9, Time.now, Time.now],
    [5, 10, Time.now, Time.now],
    [6, 11, Time.now, Time.now],
    [6, 12, Time.now, Time.now],
    [7, 13, Time.now, Time.now],
    [7, 14, Time.now, Time.now],
    [8, 15, Time.now, Time.now],
    [8, 16, Time.now, Time.now],
    [9, 17, Time.now, Time.now],
    [9, 18, Time.now, Time.now],
    [10, 19, Time.now, Time.now],
    [10, 20, Time.now, Time.now]
]

camera_photos_list.each do |camera_id, photo_id, created_at, updated_at|
    CameraPhotos.create(camera_id: camera_id, photo_id: photo_id, created_at: created_at, updated_at: updated_at)
end