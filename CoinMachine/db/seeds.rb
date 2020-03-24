# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Transaction.destroy_all
Coin.destroy_all
User.destroy_all

user = User.create!({
    email: 'bob@mortgagehippo.com',
    admin: true
})
user2 = User.create!({
    email: 'mike@mortgagehippo.com',
    admin: false
})
user3 = User.create!({
    email: 'admin2@mortgagehippo.com',
    admin: true
})
user4 = User.create!({
    email: "notadmin@mortgagehippo.com",
    admin: false
})

coin = Coin.create!({
    value: 10,
    name: 'BCoin',
    created_by: User.find_by(email: 'bob@mortgagehippo.com').id
})
coin2 = Coin.create!({
    value: 1,
    name: 'HCoin',
    created_by: User.find_by(email: 'mike@mortgagehippo.com').id
})

coin3 = Coin.create!({
    value: 1,
    name: 'HippoCoin',
    created_by: User.find_by(email: 'bob@mortgagehippo.com').id
})

transaction = Transaction.create!({
    transaction_type: 1,
    user_id: User.find_by(email: 'bob@mortgagehippo.com').id,
    coin_id: Coin.find_by(name: 'BCoin').id
})
