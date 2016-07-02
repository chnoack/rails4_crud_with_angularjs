Array(1..50).each do | index |
  User.create(first_name: "First#{index}", last_name: "Last#{index}", email: "first#{index}.last#{index}@example.com")
end

Array(1..50).each do | index |
  Account.create(user_id: index, balance: (1000*index + 5*index^2 + index^3/100), number: Time.now.to_i)
end
