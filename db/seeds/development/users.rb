user_names = []

5.times do |i| 
  user_names.push "dev_user_#{i}"
end

user_names.each do |user_name|
  User.create(user_name: user_name) unless User.exists? user_name: user_name
end
