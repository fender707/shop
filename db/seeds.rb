# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'


Product.destroy_all
Category.destroy_all
Painting.destroy_all
foto_category = Category.create!(name: 'Foto')
music_category = Category.create!(name: 'Music')
shoping_category = Category.create!(name: 'Shoping')
drink_category = Category.create!(name: 'Drink')
book_category = Category.create!(name: 'Books')
tea_category = Category.create!(name: 'Tea')
coffee_category = Category.create!(name: 'Coffee')

CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.id = row[0]
    country.name = row[1]
  end
end

CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
  State.create! do |state|
    state.name = row[0]
    state.country_id = row[2]
  end
end

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
  image_url: "Kurzweil_logo.jpg",
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
  category: book_category

},

{
  title: "The Girl on the Train",
  description: "(S J Watson, bestselling author of Before I Go To Sleep). Rachel catches the same commuter train every morning. She knows it will wait at the same signal each time, overlooking a row of back gardens.",
  image_url: "girl.jpg",
  price: "15" ,
  count: 10,
  category: book_category

},

{
  title: "Secret Garden: An Inky Treasure Hunt and Colouring Book",
  description: "This interactive activity book takes you on a ramble through a secret garden created in beautifully detailed pen-and-ink illustrations - all waiting to be brought to life through colouring",
  image_url: "garden.jpg",
  price: "18" ,
  count: 10,
  category: book_category

},

{
  title: "The Day the Crayons Quit",
  description: "Debut author Drew Daywalt and international bestseller Oliver Jeffers team up to create a colourful solution to a crayon-based crisis in this playful, imaginative story that will have children laughing.",
  image_url: "day.jpg",
  price: "20" ,
  count: 10,
  category: book_category

},

{
  title: "Black Tea",
  description: "Delicius and strong tea for real man",
  image_url: "black_tea.jpeg",
  price: "8" ,
  count: 100,
  category: tea_category

},

{
  title: "Green Tea(-2$ for 3 and more)",
  description: "Delicius and strong tea for real man.",
  image_url: "green_tea.jpeg",
  price: "7" ,
  count: 100,
  category: tea_category

},

{
  title: "Ethiopian Harrar(-50% for 2 and more)",
  description: "Delicius coffee, unforgetable taste.",
  image_url: "efiopia_harrar.jpg",
  price: "12" ,
  count: 100,
  category: coffee_category

}

])
