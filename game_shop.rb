require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
require_relative('controllers/manufacturers_controller')
require_relative( './models/product.rb' )
require_relative( './models/manufacturer.rb' )


get '/' do
  erb( :index )
end

post '/results/products' do
  @search_term = params[:search_term]
  @products = Product.search_products(params[:search_term])
  erb(:"products/results")
end

post '/results/filtered-products' do
  @products = Product.filter_manufacturers(params[:manufacturers_id])
  product = @products.first
  if product
    @search_term = product.manufacturers_name()
  end
  erb(:"products/results")
end

post '/results/manufacturers' do
  @search_term = params[:search_term]
  @manufacturers = Manufacturer.search_manufacturers(params[:search_term])
  erb(:"manufacturers/results")
end
