require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
require_relative('controllers/manufacturers_controller')
require_relative( './models/product.rb' )
require_relative( './models/manufacturer.rb' )


get '/' do
  erb( :index )
end
