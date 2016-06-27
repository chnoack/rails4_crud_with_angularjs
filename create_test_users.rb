Array(1..100).each do | index |
  User.create(first_name: "first#{index}", last_name: "last#{index}", email: "first#{index}.last#{index}@example.com")
end
