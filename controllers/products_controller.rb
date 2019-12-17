require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/product.rb' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/products' do
  # @products = Product.all()
  @products = Product.search_products("", "no")
  @manufacturers = Manufacturer.all()
  erb ( :"products/index" )
end

get '/products/new' do
  # @products = Product.all()
  @manufacturers = Manufacturer.all()
  erb(:"products/new")
end

post '/products/results' do
  @search_term = params[:search_term]
  @products = Product.search_products(params[:search_term], "no")
  @deactivated_products = Product.search_products(params[:search_term], "yes")
  erb(:"products/results")
end

post '/filtered-products/results' do
  @products = Product.filter_manufacturers(params[:manufacturers_id], "no")
  @deactivated_products = Product.filter_manufacturers(params[:manufacturers_id], "yes")
  product = @products.first
  if product
    @search_term = product.manufacturers_name()
  end
  erb(:"products/results")
end

get '/products/deactivated' do
  @deactivated_products = Product.search_products("", "yes")
  @manufacturers = Manufacturer.all()
  erb(:"products/deactivated")
end


get '/products/:id' do
  @product = Product.find(params[:id].to_i)
  erb(:"products/show")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect to '/products'
end

get '/products/:id/edit' do
  @product = Product.find(params[:id].to_i)
  @manufacturers = Manufacturer.all()
  erb(:"products/edit")
end

post '/products/:id' do
  Product.new(params).update
  redirect to '/products'
end
