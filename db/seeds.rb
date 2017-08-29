# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Prodact.delete_all
Prodact.create! id: 1, name: "Banana", price: 10,decription:"all season fruit",quantity:25, is_active: true
Prodact.create! id: 2, name: "Apple", price: 20,decription:"all season fruit",quantity:100, is_active: true
Prodact.create! id: 3, name: "Strawberries", price: 50,decription:"monsoon season fruit",quantity:15, is_active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
