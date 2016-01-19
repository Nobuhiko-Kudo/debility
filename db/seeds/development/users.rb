users = []

5.times do |i| 
  users.push({ user_name:  "dev_user_#{i}", 
               email: "dev_user_email#{i}@email.co.jp",
               password:   "p@ssw0rd" })
end

users.each do |user|
  User.create(user) unless User.exists? user_name: user[:user_name]
end
