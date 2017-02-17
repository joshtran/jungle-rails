# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'


## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

product1 = cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

product2 = cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

product3 = cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

product4 = cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

product5 = cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

product6 = cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


product7 = cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

product8 = cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

product9 = cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

product10 = cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

product11 = cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

product12 = cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

## REVIEWS

puts "Creating Reviews ..."

Review.destroy_all

review1 = product1.reviews.create!({
  user_id: 1,
  description: 'This thing is really great.',
  rating: 5
})

review2 = product2.reviews.create!({
  user_id: 1,
  description: 'This thing is pretty good.',
  rating: 4
})

review3 = product3.reviews.create!({
  user_id: 1,
  description: 'This thing is decent.',
  rating: 3
})

review4 = product4.reviews.create!({
  user_id: 1,
  description: 'This thing is okay.',
  rating: 3
})

review5 = product4.reviews.create!({
  user_id: 1,
  description: 'This thing is nice.',
  rating: 4
})

review6 = product5.reviews.create!({
  user_id: 1,
  description: 'Wonderful',
  rating: 5
})

review7 = product5.reviews.create!({
  user_id: 1,
  description: 'Pretty great',
  rating: 4
})

review8 = product6.reviews.create!({
  user_id: 1,
  description: 'Good stuff',
  rating: 5
})

review9 = product7.reviews.create!({
  user_id: 1,
  description: 'Good stuff',
  rating: 5
})

review10 = product8.reviews.create!({
  user_id: 1,
  description: 'Neato',
  rating: 5
})

review11 = product9.reviews.create!({
  user_id: 1,
  rating: 5
})

review12 = product10.reviews.create!({
  user_id: 1,
  description: 'Good stuff',
  rating: 5,
})

review13 = product11.reviews.create!({
  user_id: 1,
  description: 'Good stuff',
  rating: 5,
})

review14 = product12.reviews.create!({
  user_id: 1,
  description: 'Good stuff',
  rating: 5,
})

## USERS

puts "Creating Users ..."

User.destroy_all

user1 = User.create!({
  first_name:  'Joe',
  last_name: 'Schmoe',
  email: 'joeschmoe@example.com',
  password_digest: 'awelkf20913of31no31fd'
})


puts "DONE!"
