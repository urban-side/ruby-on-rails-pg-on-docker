# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |t|
    User.create!(
        name: "user#{t+1}",
        email: "sample#{t+1}@example.com",
        password: "hogehoge#{t+1}",
        admin: true
    )
    3.times do |n|
        Task.create!(
            title: "test#{t+1}-#{n+1}",
            description: "From seed file; #{t+1}-#{n+1}",
            status: n,
            date: "2022-01-0#{t+1} 10:00:00", 
            priority: 3-n,
            label: 0, 
            user_id: t+1
        )
    end
end