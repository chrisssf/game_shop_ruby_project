require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
require_relative('controllers/manufacturers_controller')
require_relative( './models/product.rb' )

get '/' do
  erb( :index )
end

post '/results' do
  @search_term = params[:search_term]
  @products = Product.search_products(params[:search_term])
  erb(:results)
end
