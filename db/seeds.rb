# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |t|
    Task.create(
        title: "test#{t + 1}",
        description: "これはテストです（#{t}）",
        status: t,
        date: "2022-01-0#{t + 1} 10:00:00", 
        priority: 3-t,
        label: 0, 
        user_id: t+1
    )
    User.create(
        name: "user#{t}",
        email: "sample#{t}@example.com"
    )
end