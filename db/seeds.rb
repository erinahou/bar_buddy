# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "clearing db.."
Characteristic.destroy_all
Bar.destroy_all
BarCharacteristic.destroy_all
User.destroy_all

characteristic_styles = ['pub', 'cocktail', 'wine bar', 'dive bar', 'with food', 'brewery', 'rooftop bar', 'kid friendly', 'dog friendly', 'speakeasy', 'distillery']

puts "creating characteristic styles"
characteristic_styles.each do |style|
  Characteristic.create!(style: style)
end

bars_data = [
  { name: "Mountain Goat Brewery", description: "This is a great bar", rating: 4.7, display_address: "80 North St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/U2ndtrJOBlu2bvlQyE7sig/o.jpg" },
  { name: "The Bridge Hotel", description: "This is a great bar", rating: 3.9, display_address: "642 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/oIF7yhPy8Zcpk_wo1aBfAg/o.jpg" },
  { name: "The Grand Hotel", description: "This is a great bar", rating: 3.9, display_address: "333 Burnley St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/wu__SBWOpRZvH87CPCXq0Q/o.jpg" },
  { name: "Maeve Fox", description: "This is a great bar", rating: 4.0, display_address: "472 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/12kUKu8_7Js4HmdRy5CDxg/o.jpg" },
  { name: "Two Wrongs Melbourne", description: "This is a great bar", rating: 3.7, display_address: "The Olsen, 637 Chapel St, South Yarra Victoria 3141, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/Rfz-_T0ACIDFULFnLDOdqw/o.jpg" },
  { name: "Uitgang Bar", description: "This is a great bar", rating: 5.0, display_address: "406 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/sF1ITq4ntSpxWMibD8zgHA/o.jpg" },
  { name: "The Collection", description: "This is a great bar", rating: 4.2, display_address: "328 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/OznXTedS_WPlGl13Kw-gIQ/o.jpg" },
  { name: "Concrete Boots Bar", description: "This is a great bar", rating: 4.3, display_address: "381 Burnley St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/hVzYQz5z2jekDsA6V4k3AA/o.jpg" },
  { name: "Royston Hotel", description: "This is a great bar", rating: 3.9, display_address: "12 River St, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/EREzNe1G9ghlcxPVqr4jAQ/o.jpg" },
  { name: "Royal Saxon", description: "This is a great bar", rating: 3.8, display_address: "545 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/isJfAIxnLcP0clI0d065Zw/o.jpg" },
  { name: "Precinct Hotel", description: "This is a great bar", rating: 2.7, display_address: "60 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/9AFj6e9v0L05IwchU3n_Ow/o.jpg" },
  { name: "Two Hands Rooftop & Beer Garden Eatery", description: "This is a great bar", rating: 4.3, display_address: "311A Victoria St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/UEM_HipbqptJgEbVWTvPCA/o.jpg" },
  { name: "Terminus Hotel", description: "This is a great bar", rating: 3.4, display_address: "605 Victoria St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/LRzv1Kyb_wXLjpnyllSa1g/o.jpg" },
  { name: "Public House", description: "This is a great bar", rating: 3.4, display_address: "433-435 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/B_3FvpVE_tV1-1ZjGje0JA/o.jpg" },
  { name: "Bar Económico", description: "This is a great bar", rating: 3.0, display_address: "438 Church Street, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/OAgg0sG2gp9tZmbkLYhGkw/o.jpg" },
  { name: "Botherambo", description: "This is a great bar", rating: 3.9, display_address: "65 Swan St, Melbourne Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/FFL7ZKVEgoSa-lVAHew7aA/o.jpg" },
  { name: "So Bar", description: "This is a great bar", rating: 4.5, display_address: "630 Chapel St, South Yarra Victoria 3141, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/JGHnTkOkFosv6GUKU5oMwQ/o.jpg" },
  { name: "The Aviary", description: "This is a great bar", rating: 3.8, display_address: "271 Victoria St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/GWFfffjxeY4VRyWe8S8qeQ/o.jpg" },
  { name: "Harry Juku's", description: "This is a great bar", rating: 4.0, display_address: "203 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/y2E4ZJBXXrMCoXtziQrCtQ/o.jpg" },
  { name: "Moon Dog Craft Brewery", description: "This is a great bar", rating: 4.4, display_address: "17 Duke St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/7t6rx8DGM-eSSuRLzvWqrA/o.jpg" },
  { name: "Atlas Vinifera", description: "This is a great bar", rating: 5.0, display_address: "274 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/lFEuvDNmtLfnbGaICO7wsA/o.jpg" },
  { name: "The Palm Royale", description: "This is a great bar", rating: 4.7, display_address: "438 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/heENlxE5d0uvJ6k9jaKK8w/o.jpg" },
  { name: "Swan Hotel", description: "This is a great bar", rating: 2.2, display_address: "425 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/HpmKdLwtTsrEXx42mlTOqw/o.jpg" },
  { name: "The Sporting Globe", description: "This is a great bar", rating: 4.1, display_address: "288 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/IZ-30d2aDrpOWgYsN4GueA/o.jpg" },
  { name: "Bowerbird", description: "This is a great bar", rating: 4.5, display_address: "274 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/3oJTNV0WUmga_zrTx3P0pQ/o.jpg" },
  { name: "Holliava", description: "This is a great bar", rating: 3.4, display_address: "36 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/c3jc4Rs3whlNtOPNnbtlrg/o.jpg" },
  { name: "Bouzy Rouge", description: "This is a great bar", rating: 3.1, display_address: "470 Bridge Road, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/LnDfNU-oAAh7F-hT4_KFkA/o.jpg" },
  { name: "Saint Urban", description: "This is a great bar", rating: 4.0, display_address: "213 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/FyxsJuGROP4rk5v5ErO4mQ/o.jpg" },
  { name: "Kekou", description: "This is a great bar", rating: 5.0, display_address: "396 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/7vOxVMyO6uqFRZr_G8YdqQ/o.jpg" },
  { name: "Swan Street Social", description: "This is a great bar", rating: 3.3, display_address: "177 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/vphjjGE0VTfBjP2ymSdJNA/o.jpg" },
  { name: "Monastery on Church", description: "This is a great bar", rating: 3.0, display_address: "1 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/heENlxE5d0uvJ6k9jaKK8w/o.jpg" },
  { name: "Kingston Hotel", description: "This is a great bar", rating: 4.0, display_address: "55 Highett St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/U8l3_qyYWBtnNM7kFHf58g/o.jpg" },
  { name: "Royal Oak Richmond", description: "This is a great bar", rating: 3.0, display_address: "527 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/GZKatiZFm39Rjt7XuCEr6g/o.jpg" },
  { name: "Bar Exuberante", description: "This is a great bar", rating: 5.0, display_address: "438 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/heENlxE5d0uvJ6k9jaKK8w/o.jpg" },
  { name: "Caddie", description: "This is a great bar", rating: 5.0, display_address: "167 Swan St, Richmond Victoria 3031, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/GyzLgWkJ4DFoW0ccpZza9g/o.jpg" },
  { name: "Bar 9T4", description: "This is a great bar", rating: 1.5, display_address: "94 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/heENlxE5d0uvJ6k9jaKK8w/o.jpg" },
  { name: "Prince Alfred Hotel", description: "This is a great bar", rating: 3.3, display_address: "619 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/fuUWmYf2uRhXUnPgsUPxbQ/o.jpg" },
  { name: "The Ugly Duckling", description: "This is a great bar", rating: 3.0, display_address: "238 Swan St, Melbourne Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/UEawORfE7j_2TQsmgVJt5g/o.jpg" },
  { name: "Spread Eagle Hotel", description: "This is a great bar", rating: 3.2, display_address: "372 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/2TTzWNPdGjBFVY8Tn56COg/o.jpg" },
  { name: "Rah Bar", description: "This is a great bar", rating: 2.0, display_address: "163 Toorak Rd, South Yarra Victoria 3141, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/5uBP3OBjhznz-2tEfssShw/o.jpg" }
]
puts "creating bars"
bars_data.each do |bar_data|
  Bar.create!(bar_data)
end

bars = Bar.all
characteristics = Characteristic.all

puts "creating bar characteristics"
bars.each do |bar|
  random_styles = characteristics.sample(2)

  random_styles.each do |style|
    BarCharacteristic.create!(bar: bar, characteristic: style)
  end
end

puts "creating test users"
user1 = User.create(email: 'john.doe@example.com', password: 'password', first_name: 'John', last_name: 'Doe')
user2 = User.create(email: 'jane.smith@example.com', password: 'password', first_name: 'Jane', last_name: 'Smith')
user3 = User.create(email: 'bob.johnson@example.com', password: 'password', first_name: 'Bob', last_name: 'Johnson')
user4 = User.create(email: 'alice.williams@example.com', password: 'password', first_name: 'Alice', last_name: 'Williams')
user5 = User.create(email: 'charlie.brown@example.com', password: 'password', first_name: 'Charlie', last_name: 'Brown')
