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
  { name: "Mountain Goat Brewery", description: "Industrial brewery setting serving tasty beers, pizza and bar snacks.", rating: 4.7, display_address: "80 North St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/U2ndtrJOBlu2bvlQyE7sig/o.jpg" },
  { name: "The Bridge Hotel", description: "Gourmet, global pub grub served in a hip space with exposed-brick walls & rustic-chic decor.", rating: 3.9, display_address: "642 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/oIF7yhPy8Zcpk_wo1aBfAg/o.jpg" },
  { name: "The Grand Hotel", description: "Spacious pub with a leafy beer garden, plus an elegant dining room serving upmarket Italian cuisine.", rating: 3.9, display_address: "333 Burnley St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/wu__SBWOpRZvH87CPCXq0Q/o.jpg" },
  { name: "Maeve Fox", description: "Cocktails, craft beer & bar snacks in a stylish space with exposed-brick walls & swanky booth seats.", rating: 4.0, display_address: "472 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/12kUKu8_7Js4HmdRy5CDxg/o.jpg" },
  { name: "Two Wrongs Melbourne", description: "Artful, raucous watering hole offering booth packages & private rooms with cocktails & bar bites.", rating: 3.7, display_address: "The Olsen, 637 Chapel St, South Yarra Victoria 3141, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/Rfz-_T0ACIDFULFnLDOdqw/o.jpg" },
  { name: "Uitgang Bar", description: "A gorgeous beer garden and food delivered from some of our favourite Bridge Road restaurants right to you in the bar.  If you have a pooch then you're in luck as we're very dog friendly.", rating: 5.0, display_address: "406 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/sF1ITq4ntSpxWMibD8zgHA/o.jpg" },
  { name: "The Collection", description: "Warmly lit nook with rustic-chic decor offering American bar snacks & inventive cocktails.", rating: 4.2, display_address: "328 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/OznXTedS_WPlGl13Kw-gIQ/o.jpg" },
  { name: "Concrete Boots Bar", description: "Casual hangout with unfussy decor serving craft beers & cocktails, plus burgers, schnitzels & tacos.", rating: 4.3, display_address: "381 Burnley St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/hVzYQz5z2jekDsA6V4k3AA/o.jpg" },
  { name: "Royston Hotel", description: "Jumping corner pub with a horseshoe-shaped centre bar, serving burgers, steaks and craft beer.", rating: 3.9, display_address: "12 River St, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/EREzNe1G9ghlcxPVqr4jAQ/o.jpg" },
  { name: "Royal Saxon", description: "Stylish multi-level spot with a courtyard for pub classics, pizza & cocktails, plus DJs & events.", rating: 3.8, display_address: "545 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/isJfAIxnLcP0clI0d065Zw/o.jpg" },
  { name: "Precinct Hotel", description: "Family-owned bar with a wooden deck and Modern Australian pub food, plus live music at weekends.", rating: 2.7, display_address: "60 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/9AFj6e9v0L05IwchU3n_Ow/o.jpg" },
  { name: "Two Hands Rooftop & Beer Garden Eatery", description: "Two Hands Bar is very good place to chill with your friend's. Two Hands Bar in Abbotsford is surrounded by Richmond, Collingwood, Fitzroy, Hawthorn, Kew and Carlton and will keep you there throughout the day.", rating: 4.3, display_address: "311A Victoria St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/UEM_HipbqptJgEbVWTvPCA/o.jpg" },
  { name: "Terminus Hotel", description: "Art deco venue plating pub classics with a modern twist, plus a beer garden and outdoor terrace bar.", rating: 3.4, display_address: "605 Victoria St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/LRzv1Kyb_wXLjpnyllSa1g/o.jpg" },
  { name: "Public House", description: "Tasting plates, Modern Australian mains and cocktail carafes in a hip pub with a roof terrace.", rating: 3.4, display_address: "433-435 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/B_3FvpVE_tV1-1ZjGje0JA/o.jpg" },
  { name: "Bar Económico", description: "Meticulously styled, shabby dive bar complete with pastel coloured walls, drink tickets, caged service areas and florescent lighting.", rating: 3.0, display_address: "438 Church Street, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/OAgg0sG2gp9tZmbkLYhGkw/o.jpg" },
  { name: "Botherambo", description: "Southeast Asian cuisine, plus cocktails, in a hip venue with exposed-brick walls and hanging plants.", rating: 3.9, display_address: "65 Swan St, Melbourne Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/FFL7ZKVEgoSa-lVAHew7aA/o.jpg" },
  { name: "So Bar", description: "An intimate table service cocktail bar and restaurant nestled in the historic lanes of Richmond", rating: 4.5, display_address: "630 Chapel St, South Yarra Victoria 3141, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/JGHnTkOkFosv6GUKU5oMwQ/o.jpg" },
  { name: "The Aviary", description: "Elevated pub grub, plus cocktails, in a light-filled, relaxed venue with a buzzing beer garden.", rating: 3.8, display_address: "271 Victoria St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/GWFfffjxeY4VRyWe8S8qeQ/o.jpg" },
  { name: "Harry Juku's", description: "Full blown Tokyo underground inspired fit out, sake cocktails and quirky features", rating: 4.0, display_address: "203 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/y2E4ZJBXXrMCoXtziQrCtQ/o.jpg" },
  { name: "Moon Dog Craft Brewery", description: "Craft brewery featuring a funky bar in an industrial space, plus a vintage van with pizza.", rating: 4.4, display_address: "17 Duke St, Abbotsford Victoria 3067, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/7t6rx8DGM-eSSuRLzvWqrA/o.jpg" },
  { name: "Atlas Vinifera", description: "A small, cosy wine bar and wine store located on Church Street, boasting a diverse range of wines by the glass, a rotating selection of cheeses and charcuterie", rating: 5.0, display_address: "274 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/lFEuvDNmtLfnbGaICO7wsA/o.jpg" },
  { name: "The Palm Royale", description: "Intimate cocktail bar with amazing drinks and great service", rating: 4.7, display_address: "438 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/heENlxE5d0uvJ6k9jaKK8w/o.jpg" },
  { name: "Swan Hotel", description: "Easygoing watering hole with streetside tables for live music on weekends & classic pub meals.", rating: 2.2, display_address: "425 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/HpmKdLwtTsrEXx42mlTOqw/o.jpg" },
  { name: "The Sporting Globe", description: "Modern, roomy venue with booths and screens showing live sports, plus hearty pub-style meals.", rating: 4.1, display_address: "288 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/IZ-30d2aDrpOWgYsN4GueA/o.jpg" },
  { name: "Bowerbird", description: "Bar specializing in locally-produced gin, served in an spot with brick walls & modern wood decor.", rating: 4.5, display_address: "274 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/3oJTNV0WUmga_zrTx3P0pQ/o.jpg" },
  { name: "Holliava", description: "Clever cocktails & beer in a bi-level bar with exposed-brick walls, street art & a large courtyard.", rating: 3.4, display_address: "36 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/c3jc4Rs3whlNtOPNnbtlrg/o.jpg" },
  { name: "Bouzy Rouge", description: "Tapas and paella, plus Portuguese dishes and cocktails, in an eclectic room with exposed brickwork.", rating: 3.1, display_address: "470 Bridge Road, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/LnDfNU-oAAh7F-hT4_KFkA/o.jpg" },
  { name: "Saint Urban", description: "Neighbourhood wine bar specializing in european wines and share plates.", rating: 4.0, display_address: "213 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/FyxsJuGROP4rk5v5ErO4mQ/o.jpg" },
  { name: "Kekou", description: "A Contemporary Pan-Asian Dining Locale on Bridge Road.", rating: 5.0, display_address: "396 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/7vOxVMyO6uqFRZr_G8YdqQ/o.jpg" },
  { name: "Swan Street Social", description: "Spacious, modern pub with large plasma TVs, betting facilities and hearty bistro meals, plus trivia.", rating: 3.3, display_address: "177 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/vphjjGE0VTfBjP2ymSdJNA/o.jpg" },
  { name: "Kingston Hotel", description: "Modern Australian food in an 1880s pub with an old-world bar & restaurant overlooking a courtyard.", rating: 4.0, display_address: "55 Highett St, Richmond Victoria 3121, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/U8l3_qyYWBtnNM7kFHf58g/o.jpg" },
  { name: "Royal Oak Richmond", description: "Pub fare offered in an easygoing setting with fireplaces, sports on big screens & TAB facilities.", rating: 3.0, display_address: "527 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/GZKatiZFm39Rjt7XuCEr6g/o.jpg" },
  { name: "Bar Exuberante", description: "If a great cocktail is, to you, not only a drink but in fact a way of life, then Church Street's Bar Exuberante is the ideal place to indulge.", rating: 5.0, display_address: "438 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/heENlxE5d0uvJ6k9jaKK8w/o.jpg" },
  { name: "Caddie", description: "Caddie is totally stripped back with good food and drink at its core. Its a place where people can meet for a drink or two or stay for long lunch or dinner.", rating: 5.0, display_address: "167 Swan St, Richmond Victoria 3031, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/GyzLgWkJ4DFoW0ccpZza9g/o.jpg" },
  { name: "Bar 9T4", description: "Bar 9t4 has been one of Richmond's most popular watering holes for years and is known for being a loud and loose late-night party venue.", rating: 1.5, display_address: "94 Swan St, Richmond Victoria 3121, Australia", image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/heENlxE5d0uvJ6k9jaKK8w/o.jpg" },
  { name: "Prince Alfred Hotel", description: "Elevated pub eats & drinks in a warm space with timber decor & a buzzing, leafy beer garden.", rating: 3.3, display_address: "619 Church St, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/fuUWmYf2uRhXUnPgsUPxbQ/o.jpg" },
  { name: "The Ugly Duckling", description: "The Ugly Duckling is a stylish table service cocktail and wine bar in the heart of Swan Street, Richmond, Victoria.", rating: 3.0, display_address: "238 Swan St, Melbourne Victoria 3121, Australia", image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/UEawORfE7j_2TQsmgVJt5g/o.jpg" },
  { name: "Spread Eagle Hotel", description: "Upmarket Modern Australian dishes in a long-running pub with fireplaces and leather chairs.", rating: 3.2, display_address: "372 Bridge Rd, Richmond Victoria 3121, Australia", image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/2TTzWNPdGjBFVY8Tn56COg/o.jpg" },
  { name: "Rah Bar", description: "One of South Yarra's original party hotspots, Rah Bar provides a unique party experience located in a central location on Toorak Road, South Yarra in a fabulous Heritage Listed building coupled with amazing Moroccan decor with fantastic facilities.", rating: 2.0, display_address: "163 Toorak Rd, South Yarra Victoria 3141, Australia", image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/5uBP3OBjhznz-2tEfssShw/o.jpg" }
]
puts "creating bars"
bars_data.each do |bar_data|
  Bar.create!(bar_data)
end

bar_images_data = [
  # Bar 1 images
  { bar_id: 1, image_url: "https://cdn.broadsheet.com.au/cache/da/75/da7505d367c74e7697728c8d67172bc8.jpg" },
  { bar_id: 1, image_url: "https://cdn.broadsheet.com.au/cache/68/ef/68ef3a4bfd836552c3dbee9d3f754bd5.jpg" },
  { bar_id: 1, image_url: "https://cdn.broadsheet.com.au/cache/36/24/3624a1af5865abadb3b627a34c88ebc3.jpg" },

  # Bar 2 images
  { bar_id: 2, image_url: "https://thebridgehotel.com.au/wp-content/uploads/2022/09/BridgeThurs-BJ-Small-4-1290x650.jpg" },
  { bar_id: 2, image_url: "https://thebridgehotel.com.au/wp-content/uploads/2022/09/BridgeHotel_21-1290x650.jpg" },
  { bar_id: 2, image_url: "https://thebridgehotel.com.au/wp-content/uploads/2022/09/DSC00364-10-1-1030x555.png" },

  # Bar 3 images
  { bar_id: 3, image_url: "https://images.squarespace-cdn.com/content/v1/57831e9837c581c34c7d4d72/1468861178379-ZJ2U144BZJ2KUCI4ELYP/como_15.jpg?format=1000w" },
  { bar_id: 3, image_url: "https://images.squarespace-cdn.com/content/v1/57831e9837c581c34c7d4d72/1468861178379-ZJ2U144BZJ2KUCI4ELYP/como_15.jpg?format=1000w" },
  { bar_id: 3, image_url: "https://www.bestrestaurants.com.au/media/a0uoioju/1.jpg?width=1200&v=1d80e51e7c755d0" },

  # Bar 4 images
  { bar_id: 4, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2017/07/maeve-fox-function-venues-melbourne-private-event-rooms-corporate-venue-hire-cocktail-party-002.jpg" },
  { bar_id: 4, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2017/07/maeve-fox-function-venues-melbourne-private-event-rooms-corporate-venue-hire-cocktail-party-003.jpg" },
  { bar_id: 4, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2017/07/maeve-fox-function-venues-melbourne-private-event-rooms-corporate-venue-hire-cocktail-party-005.jpg" },

  # Bar 5 images
  { bar_id: 5, image_url: "https://img.delicious.com.au/eSYtxkP8/w759-h506-cfill/del/2015/12/two-wrongs-melbourne-24606-2.jpg" },
  { bar_id: 5, image_url: "https://cdn.broadsheet.com.au/cache/60/c9/60c965fc0b26f3302233a1ac6a6fe401.jpg" },
  { bar_id: 5, image_url: "https://thecitylane.com/wp-content/uploads/2017/04/IMG_20170407_222103.jpg" },

  # Bar 6 images
  { bar_id: 6, image_url: "https://thecitylane.com/wp-content/uploads/2017/04/IMG_20170407_221553.jpg" },
  { bar_id: 6, image_url: "https://cdn.concreteplayground.com/content/uploads/2017/04/uitgang-bar-exit-brewing-melbourne-1920x1440.jpg" },
  { bar_id: 6, image_url: "https://thecitylane.com/wp-content/uploads/2017/04/IMG_20170407_222103.jpg" },

  # Bar 7 images
  { bar_id: 7, image_url: "https://cdn.broadsheet.com.au/cache/c7/0d/c70d426aa091d7d25c8327f11d695be1.jpg" },
  { bar_id: 7, image_url: "https://cdn.broadsheet.com.au/cache/62/4c/624c54269ffc40b83725b55ee2c88bc5.jpg" },
  { bar_id: 7, image_url: "https://cdn.broadsheet.com.au/cache/ec/96/ec96fc1e296ebeb4d695233ba345cd97.jpg" },

  # Bar 8 images
  { bar_id: 8, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2017/03/Concrete-Boots-Bar-Melbourne-Bars-Richmond-Cocktail-Top-Best-Good-Small-Cool-2.jpg" },
  { bar_id: 8, image_url: "https://www.tagvenue.com/resize/01/17/widen-1680-noupsize;8332-entire-venue-room.jpg" },
  { bar_id: 8, image_url: "https://www.concretebootsbar.com/wp-content/uploads/2017/10/people-at-concrete-boots-bar-18.jpg" },

  # Bar 9 images
  { bar_id: 9, image_url: "https://images.squarespace-cdn.com/content/v1/5566a229e4b00e5080aa378a/1659455489423-VMVYZSFTFYZSKDTJZUQM/RoystonHotel.jpg" },
  { bar_id: 9, image_url: "https://images.squarespace-cdn.com/content/v1/5566a229e4b00e5080aa378a/1659455490126-2GA0BEX11QEX0DXEWBF9/RoystonHotelFrontBar.jpg" },
  { bar_id: 9, image_url: "https://cdn.broadsheet.com.au/cache/53/9e/539e62d35d4b1fd6932ab2c6ee3fdada.jpg" },

  # Bar 10 images
  { bar_id: 10, image_url: "https://images.squarespace-cdn.com/content/v1/5d9184ca9da20146d4155a83/1591841458001-EKCUPMGWM3VUXEZ22GVZ/Courtyard.jpg" },
  { bar_id: 10, image_url: "https://cdn.concreteplayground.com/content/uploads/2018/08/royal-saxon-melbourne-giulia-morlando-01.jpg" },
  { bar_id: 10, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2016/10/Royal-Saxon-Bar-Richmond-Bars-Melbourne-Cocktail-Top-Best-Good-001.jpg" },

  # Bar 11 images
  { bar_id: 11, image_url: "https://precincthotel.com.au/wp-content/uploads/slider/cache/e00bbb82bc26652f761a1b08b0f46fde/Home-Slider-3.jpg" },
  { bar_id: 11, image_url: "https://precincthotel.com.au/wp-content/uploads/slider/cache/02dbd83f5852bd43fae3be88c0b0978e/Courtyard-2.jpg" },
  { bar_id: 11, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2019/09/precinct-hotel-cremorne-richmond-bars-melbourne-bar-top-best-good-new-hidden-rooftop-laneway-004.jpg" },

  # Bar 12 images
  { bar_id: 12, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/24/0d/9d/48/two-hands-rooftop-indoors.jpg" },
  { bar_id: 12, image_url: "https://headbox-media.imgix.net/spaces/29371/photos/3247bc45-688b-4343-aab1-eda8ef57e021_6.png?auto=format&ar=3%3A2&fit=crop&q=60&ixlib=react-9.5.4" },
  { bar_id: 12, image_url: "https://www.tagvenue.com/resize/32/b3/widen-1680-noupsize;24922-rooftop-outdoors-room.jpeg" },

  # Bar 13 images
  { bar_id: 13, image_url: "https://theterminushotel.com.au/wp-content/uploads/2022/09/terminus_header-2-1-1290x650.jpg" },
  { bar_id: 13, image_url: "https://www.australiandesignreview.com/wp-content/uploads/2014/08/Terminus-7.jpg" },
  { bar_id: 13, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2021/02/terminus-hotel-function-venues-rooms-melbourne-venue-hire-room-event-engagement-corporate-wedding-small-birthday-party-fitzroy-1.jpg" },

  # Bar 14 images
  { bar_id: 14, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/1c/98/07/70/public-house-rooftop.jpg" },
  { bar_id: 14, image_url: "https://cdn.concreteplayground.com/content/uploads/2014/01/public-house-melbourne-giulia-morlando-04.jpg" },
  { bar_id: 14, image_url: "https://images.otstatic.com/prod1/37190247/2/large.png" },

  # Bar 15 images
  { bar_id: 15, image_url: "https://cdn.broadsheet.com.au/cache/13/91/1391e0ebb7f4568c4b78136e29845711.jpg" },
  { bar_id: 15, image_url: "https://static.ffx.io/images/$zoom_1%2C$multiply_0.2963%2C$ratio_1.777778%2C$width_1971%2C$x_27%2C$y_16/t_crop_custom/q_86%2Cf_auto/1e13404d5c1c867ae73ece2ca432ba660af1589e" },
  { bar_id: 15, image_url: "https://concreteplayground.com/content/uploads/2014/06/bareconomico.jpg" },

  # Bar 16 images
  { bar_id: 16, image_url: "https://cdn.broadsheet.com.au/cache/d0/94/d09410132442c30eacbb43079420ef37.jpg" },
  { bar_id: 16, image_url: "https://media.timeout.com/images/104103370/750/422/image.jpg" },
  { bar_id: 16, image_url: "https://swan.st/wp-content/uploads/2017/10/IMG_5059_preview.jpeg" },

  # Bar 17 images
  { bar_id: 17, image_url: "https://images.squarespace-cdn.com/content/v1/65c60858237da245c10ffd81/d6105725-de20-4b68-8f65-215db41a3165/SOBAR+Photos-66.jpg" },
  { bar_id: 17, image_url: "https://images.squarespace-cdn.com/content/v1/65c60858237da245c10ffd81/8938d4af-eede-43f6-afa1-bf4812a040b4/SOBAR+Photos-3.jpg" },
  { bar_id: 17, image_url: "https://eu-assets.simpleview-europe.com/thames/imageresizer/?image=%2Fdmsimgs%2FSo_Bar_1479167438.jpg&action=ProductDetail" },

  # Bar 18 images
  { bar_id: 18, image_url: "https://beat.com.au/wp-content/uploads/2014/10/aviaryphoto.jpeg" },
  { bar_id: 18, image_url: "https://images.squarespace-cdn.com/content/v1/5e223a483b89311c79bee92a/1675153858580-W9A8ST7MNHKR8R64RU4L/TheAviary_21-10_009.jpg" },
  { bar_id: 18, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2023/03/the-aviary-abbotsford-bars-melbourne-bar-top-best-good-new-hidden-rooftop-laneway-10.jpg" },

  # Bar 19 images
  { bar_id: 19, image_url: "https://live.staticflickr.com/3803/9650121459_4e835b54db_b.jpg" },
  { bar_id: 19, image_url: "https://www.hospitality-interiors.net/wp-content/uploads/2023/04/harryjukus1.w.jpg" },
  { bar_id: 19, image_url: "https://i.pinimg.com/originals/99/2d/a1/992da1677cc9ee9f2d6a2507a117dd24.jpg" },

  # Bar 20 images
  { bar_id: 20, image_url: "https://craftypint.com/thumb/1700x1150/crop/https:/craftypint.s3.amazonaws.com/crafty5/brewer/Moon-Dog-supplied-2019-9-190527-115215.jpg" },
  { bar_id: 20, image_url: "https://cdn.broadsheet.com.au/cache/ef/3d/ef3dfc8ec1fa508888d8841a78f25b49.jpg" },
  { bar_id: 20, image_url: "https://origin.go.gq.com.au/wp-content/uploads/2019/10/moon-dog-world-1.jpg" },

  # Bar 21 images
  { bar_id: 21, image_url: "https://cdn.broadsheet.com.au/cache/e7/25/e725b248eb1c1ae9b3f5b3d529ffc5ad.jpg" },
  { bar_id: 21, image_url: "https://cdn.broadsheet.com.au/cache/00/2f/002f0cbf2a276d67b42a9842718e2293.jpg" },
  { bar_id: 21, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/0f/ff/e9/74/atlas-vinifera-wine-shop.jpg" },

  # Bar 22 images
  { bar_id: 22, image_url: "https://cdn.broadsheet.com.au/cache/04/3a/043abb72735bbcd74a9a9e9c42ab26f9.jpg" },
  { bar_id: 22, image_url: "https://cdn.broadsheet.com.au/cache/b6/5a/b65ac095e4ac21f5a5ac0a527b782007.jpg" },
  { bar_id: 22, image_url: "https://media.timeout.com/images/103787613/750/422/image.jpg" },

  # Bar 23 images
  { bar_id: 23, image_url: "https://resizer.otstatic.com/v2/photos/xlarge/2/47505719.jpg" },
  { bar_id: 23, image_url: "https://cdn.concreteplayground.com/content/uploads/2018/07/swan-hotel-melbourne-giulia-morlando-01.jpg" },
  { bar_id: 23, image_url: "https://pupsy.com.au/wp-content/uploads/2022/04/Swan-Hotel-Richmond-20.jpg" },

  # Bar 24 images
  { bar_id: 24, image_url: "https://d5f4o788fq4br.cloudfront.net/images/locations-gallery/m-ri-gallery-1" },
  { bar_id: 24, image_url: "https://eatdrinkcheap.com.au/images/venue/the-sporting-globe-richmond.jpg" },
  { bar_id: 24, image_url: "https://d5f4o788fq4br.cloudfront.net/images/open-graph/location-geelong" },

  # Bar 25 images
  { bar_id: 25, image_url: "https://static1.squarespace.com/static/6413a38616e68c0a5ac1ca1f/t/645dc0b81d609203e87f04b7/1683865797615/Bowerbird7-min.jpg?format=1500w" },
  { bar_id: 25, image_url: "https://edqkvt6c5r7.exactdn.com/wp-content/uploads/2020/05/Bowerbird-Bar-2.jpg?strip=all&lossy=1&ssl=1" },
  { bar_id: 25, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2022/02/Bowerbird-bars-Melbourne-bar-richmond-top-best-popular-cocktail-good-date-wine-hidden-5.jpg" },

  # Bar 26 images
  { bar_id: 26, image_url: "https://www.bestrestaurants.com.au/media/bfnf0aoh/3-1.jpg?width=1200&rnd=132917167715370000" },
  { bar_id: 26, image_url: "https://holliava.com.au/wp-content/uploads/2022/09/beer-Garden-holliava-1125x650.png" },
  { bar_id: 26, image_url: "https://www.venuereport.com/media/cache/resolve/venue_gallery_big/uploads/venues/27102/originals/Holli+front+roomjpg.jpg" },

  # Bar 27 images
  { bar_id: 27, image_url: "https://bouzyrouge.com.au/wp-content/uploads/2019/07/Hero-Private-Room-1-1800x900.jpg" },
  { bar_id: 27, image_url: "https://bouzyrouge.com.au/wp-content/uploads/2019/02/photo1-1-1800x900.jpg" },
  { bar_id: 27, image_url: "https://bouzyrouge.com.au/wp-content/uploads/2019/07/1Z1A4696-1800x833.jpg" },

  # Bar 28 images
  { bar_id: 28, image_url: "https://web-els-gfgcblog-production.azurewebsites.net/wp-content/uploads/2015/09/9.jpg" },
  { bar_id: 28, image_url: "https://eatdrinkcheap.com.au/images/venue/saint-urban-richmond.jpg" },
  { bar_id: 28, image_url: "https://img.delicious.com.au/u-XK31Q2/del/2020/01/saint-urban-richmond-123840-2.jpg" },

  # Bar 29 images
  { bar_id: 29, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/18/c5/89/4a/welcome-to-kekou.jpg" },
  { bar_id: 29, image_url: "https://images.squarespace-cdn.com/content/v1/6327caa2b0287829120efc82/e6c3ec8e-c743-41b1-b3fc-f47ec6a6d082/Kekou_13-7_004.jpg" },
  { bar_id: 29, image_url: "https://media.timeout.com/images/105895933/750/422/image.jpg" },

  # Bar 30 images
  { bar_id: 30, image_url: "https://www.richmondsocial.com.au/wp-content/uploads/2018/02/114.jpg" },
  { bar_id: 30, image_url: "https://www.richmondsocial.com.au/wp-content/uploads/2018/11/Richmond-Social-Bird-Cage.jpg" },
  { bar_id: 30, image_url: "https://images.squarespace-cdn.com/content/v1/58745bf06a4963044b2614aa/1510873553802-VGD4HDEAZY5UMONPYPQ6/IMG_01962.jpg" },

  # Bar 31 images
  { bar_id: 31, image_url: "https://www.thekingston.com.au/wp-content/uploads/elementor/thumbs/The_Kingston_017-scaled-pt4p874cvscvwdvai9wblqzmqqjd0a3qfwtv9417s0.jpg" },
  { bar_id: 31, image_url: "https://www.thekingston.com.au/wp-content/uploads/elementor/thumbs/thekingston4971-prlcns60lg37dt7dfjkov6an4qhdqddxhf495aefts.jpg" },
  { bar_id: 31, image_url: "https://eatdrinkcheap.com.au/images/venue/kingston-hotel-richmond.jpg" },

  # Bar 32 images
  { bar_id: 32, image_url: "https://images.squarespace-cdn.com/content/v1/5f0d229ceb475a57e888172f/1600219650925-1H6ORR9GMF5N8BSL1O24/Home-Supp+Content-Bistro-Square.jpg" },
  { bar_id: 32, image_url: "https://images.localista.com.au/eatingout/343853_lrg.jpg" },
  { bar_id: 32, image_url: "https://res.cloudinary.com/tf-lab/image/upload/f_auto,q_auto,w_664,h_374/restaurant/34d0329e-17c6-4b27-9390-de59beffc9a0/2ef15755-66fa-4272-aacb-56b78d565ec4.jpg" },

  # Bar 33 images
  { bar_id: 33, image_url: "https://cdn.broadsheet.com.au/cache/18/08/1808315503e12388d9a3d90437b19cf4.jpg" },
  { bar_id: 33, image_url: "https://cdn.concreteplayground.com/content/uploads/2015/02/rum-1920x1080.jpg" },
  { bar_id: 33, image_url: "https://static.ffx.io/images/$zoom_1%2C$multiply_0.372%2C$ratio_1.777778%2C$width_2000%2C$x_0%2C$y_16/t_crop_custom/q_86%2Cf_auto/0f6685dfe034e737a6b342f33e232260be6dcb2f" },

  # Bar 34 images
  { bar_id: 34, image_url: "https://cdn.broadsheet.com.au/cache/1f/49/1f49f446944fd003ea40709570b210d5.jpg" },
  { bar_id: 34, image_url: "https://thecitylane.com/wp-content/uploads/2018/06/DSCF8307.jpg" },
  { bar_id: 34, image_url: "https://thecitylane.com/wp-content/uploads/2018/06/DSCF8303.jpg" },

  # Bar 35 images
  { bar_id: 35, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2017/09/Bar-9t4-Richmond-Bars-Melbourne-Swan-St-Top-Best-Good-Unique-Small-Sports-Cocktail-Outdoor-Pub-Pubs-Club-Live-Music-After-Work-Drinks-001.jpg" },
  { bar_id: 35, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2017/09/Bar-9t4-Richmond-Bars-Melbourne-Swan-St-Top-Best-Good-Unique-Small-Sports-Cocktail-Outdoor-Pub-Pubs-Club-Live-Music-After-Work-Drinks-002.jpg" },
  { bar_id: 35, image_url: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2017/09/Bar-9t4-Richmond-Bars-Melbourne-Swan-St-Top-Best-Good-Unique-Small-Sports-Cocktail-Outdoor-Pub-Pubs-Club-Live-Music-After-Work-Drinks-005.jpg" },

  # Bar 36 images
  { bar_id: 36, image_url: "https://www.eccoenterprises.com.au/wp-content/uploads/2018/07/pic-hero.jpg" },
  { bar_id: 36, image_url: "https://media.timeout.com/images/105263315/image.jpg" },
  { bar_id: 36, image_url: "https://cdn.broadsheet.com.au/cache/0f/0c/0f0cd714f024cde4f8d962170749baec.jpg" },

  # Bar 37 images
  { bar_id: 37, image_url: "https://www.eccoenterprises.com.au/wp-content/uploads/2018/07/pic-hero.jpg" },
  { bar_id: 37, image_url: "https://media.timeout.com/images/105263315/image.jpg" },
  { bar_id: 37, image_url: "https://media.timeout.com/images/103686907/image.jpg" },

  # Bar 38 images
  { bar_id: 38, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/13/80/0b/24/restaurant.jpg" },
  { bar_id: 38, image_url: "https://cdn.concreteplayground.com/content/uploads/2023/05/Spread-Eagle-Hotel-credit-AM-PRODUCTIONS-.jpg" },
  { bar_id: 38, image_url: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/190463540.jpg?k=1ac589e9994a892d89bd35840a3fcf8861eba00ee67f1b62ac4874e6e311964d&o=&hp=1" },

  # Bar 39 images
  { bar_id: 39, image_url: "https://beat.com.au/wp-content/uploads/2019/05/rah-bar.png" },
  { bar_id: 39, image_url: "https://i.pinimg.com/736x/ac/a0/38/aca038d3e62927652b1dcfa8de32e77a.jpg" },
  { bar_id: 39, image_url: "https://www.venuebat.com.au/system/venue_pictures/pictures/000/003/132/large/Main_Bar.jpg?1410327579" },
]

BarImage.create(bar_images_data)

bars_characteristics_mapping = {
  1 => [6, 5],
  2 => [1, 5],
  3 => [1, 5],
  4 => [2, 5],
  5 => [2, 4],
  6 => [4, 9],
  7 => [2, 4],
  8 => [2, 5],
  9 => [1, 5],
  10 => [1, 5],
  11 => [5, 7],
  12 => [1, 7],
  13 => [2, 7],
  14 => [4, 10],
  15 => [3, 4],
  16 => [2, 5],
  17 => [3, 4],
  18 => [2, 5],
  19 => [1, 5],
  20 => [2, 10],
  21 => [5, 6],
  22 => [3, 5],
  23 => [3, 2],
  24 => [1, 5],
  25 => [1, 7],
  26 => [2, 11],
  27 => [7, 2],
  28 => [2, 5],
  29 => [1, 5],
  30 => [8, 4],
  31 => [1, 5],
  32 => [1, 5],
  33 => [1, 5],
  34 => [2, 9],
  35 => [3, 4],
  36 => [5, 8],
  37 => [2, 5],
  38 => [1, 5],
  39 => [2, 3],
}
puts "Assigning specific characteristics to bars"
bars_characteristics_mapping.each do |bar_id, characteristic_ids|
  bar = Bar.find(bar_id)
  characteristics = Characteristic.where(id: characteristic_ids)

  characteristics.each do |characteristic|
    BarCharacteristic.create!(bar: bar, characteristic: characteristic)
  end
end

puts "creating test users"
user1 = User.create(email: 'john.doe@example.com', password: 'password', first_name: 'John', last_name: 'Doe')
user2 = User.create(email: 'jane.smith@example.com', password: 'password', first_name: 'Jane', last_name: 'Smith')
user3 = User.create(email: 'bob.johnson@example.com', password: 'password', first_name: 'Bob', last_name: 'Johnson')
user4 = User.create(email: 'alice.williams@example.com', password: 'password', first_name: 'Alice', last_name: 'Williams')
user5 = User.create(email: 'charlie.brown@example.com', password: 'password', first_name: 'Charlie', last_name: 'Brown')
