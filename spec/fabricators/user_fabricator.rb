Fabricator(:user) do 
  email { Faker::Internet.email}
  full_name { Faker::Name.name}
  password 'password'
end

Fabricator(:admin, from: :user) do 
  admin true
end