# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all
Category.destroy_all

foto_category = Category.create!(name: 'Foto')
music_category = Category.create!(name: 'Music')
shoping_category = Category.create!(name: 'Shoping')
drink_category = Category.create!(name: 'Drink')

Product.create!([
{  
  title: "NikonD3100",
  description: "Cool photo. fsgdfghfgfgsdfg",
  image_url: "images.jpeg",
  price: "750" ,
  count: 5,
  category: foto_category
},

{
  title: "CanonD550",
  description: "The 550D uses a new, 18.7 (total) megapixel sensor that's similar, but not exactly the same as the one featured in the EOS 7D. Also central to the impressive specification of the EOS 550D.",
  image_url: "images.jpeg",
  price: "6000" ,
  count: 10,
  category: foto_category
},

{
  title: "Canon600D",
  description: "The 18 megapixel Canon EOS 600D (called the Digital Rebel T3i in North America) is a new DSLR camera that sits above last year’s 550D / T2i at the top of Canon’s entry-level EOS line-up.",
  image_url: "images.jpeg",
  price: "500" ,
  count: 10,
  category: foto_category
},

{
  title: "Fender Strat 1969",
  description: "Lovely guitar of million people. Nice sound, nice price, many different combination of pick-up",
  image_url: "Fender_logo.png",
  price: "2000" ,
  count: 2,
  category: music_category
},

{
  title: "Kurzweil SP4-7",
  description: "Kurzweil's SP4-7 is the modern successor to our best selling SP76, which famously combined world-class Kurzweil sound quality with previously unheard of affordability and portability.",
  image_url: "images.jpeg",
  price: "800" ,
  count: 10,
  category: music_category

}, 

{
  title: "Carriage",
  description: "Carriage for shoping",
  image_url: "small_logo.jpg",
  price: "25" ,
  count: 50,
  category: shoping_category

}, 

{
  title: "Old Hopking Dark Rum",
  description: "Oops!..",
  image_url: "rum.jpg",
  price: "9" ,
  count: 10,
  category: drink_category

},

{
  title: "Tamova Vodka",
  description: "Russian one.",
  image_url: "vodka.jpg",
  price: "2" ,
  count: 100,
  category: drink_category

},

{
  title: "Bellucci Amaretto Liqueur",
  description: "40 degrees.uuuuuhh.",
  image_url: "belluchi.jpg",
  price: "5" ,
  count: 10,
  category: drink_category

},

{
  title: "Oliver Cromwell London Dry Gin",
  description: "Nice. Very good mood.",
  image_url: "oliver.jpg",
  price: "10" ,
  count: 10,
  category: drink_category

}


])
