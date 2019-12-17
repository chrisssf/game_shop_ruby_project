require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
require_relative('controllers/manufacturers_controller')
require_relative( './models/product.rb' )
require_relative( './models/manufacturer.rb' )
also_reload( '../models/*' )


get '/' do
  erb( :index )
end
