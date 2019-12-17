require_relative('../models/product')
require_relative('../models/manufacturer')
require('pry')

Product.delete_all()
Manufacturer.delete_all()

manufacturer1 = Manufacturer.new({
  'name' => 'Activision',
  'country' => 'USA',
  'description' => 'American games publisher based in California',
  'deactivated' => 'no'
  })
manufacturer1.save()

manufacturer2 = Manufacturer.new({
  'name' => 'EA',
  'country' => 'USA',
  'description' => 'American games publisher based in California',
  'deactivated' => 'no'
  })
manufacturer2.save()

manufacturer3 = Manufacturer.new({
  'name' => 'Square Enix',
  'country' => 'Japan',
  'description' => 'Japanese games publisher based in Tokyo which is most famous for making RPGs',
  'deactivated' => 'no'
  })
manufacturer3.save()


product1 = Product.new ({
  'name' => 'Call of Duty',
  'description' => 'best selling shooting game',
  'stock_quantity' => 20,
  'buying_cost' => 30.50,
  'selling_price' => 50.00,
  'genre' => 'FPS',
  'type' => 'Xbox game',
  'manufacturers_id' => manufacturer1.id,
  'deactivated' => 'no'
})
product1.save()

product2 = Product.new ({
  'name' => 'Crash Bandicoot',
  'description' => 'old school adventure game',
  'stock_quantity' => 14,
  'buying_cost' => 25.00,
  'selling_price' => 35.00,
  'genre' => 'Action',
  'type' => 'PS4 game',
  'manufacturers_id' => manufacturer1.id,
  'deactivated' => 'no'
})
product2.save()

product3 = Product.new ({
  'name' => 'Fifa 20',
  'description' => 'most popular football game',
  'stock_quantity' => 32,
  'buying_cost' => 40.00,
  'selling_price' => 60.00,
  'genre' => 'Sports',
  'type' => 'PS4 game',
  'manufacturers_id' => manufacturer2.id,
  'deactivated' => 'no'
})
product3.save()

product4 = Product.new ({
  'name' => 'Final Fantasy',
  'description' => 'part of an epic RPG series',
  'stock_quantity' => 9,
  'buying_cost' => 30.00,
  'selling_price' => 50.00,
  'genre' => 'RPG',
  'type' => 'PS4 Game',
  'manufacturers_id' => manufacturer3.id,
  'deactivated' => 'no'
})
product4.save()

binding.pry
nil
