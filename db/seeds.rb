# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all

Product.create!([
{  
  title: "NikonD3100",
  description: "Cool photo. fsgdfghfgfgsdfg",
  price: "750" ,
  count: 5
},

{
  title: "CanonD550",
  description: "Very good. dfdfgdfgdfgdfgdfgd",
  price: "6000" ,
  count: 10
},

{
  title: "CanonD650",
  description: "Nice photo. Hello world",
  price: "6000" ,
  count: 10
}


])
