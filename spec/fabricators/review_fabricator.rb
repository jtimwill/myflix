Fabricator(:review) do
  rating { Faker::Number.number(6)}
  content { Faker::Lorem.paragraph}
end
