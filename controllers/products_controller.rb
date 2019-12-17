require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/product.rb' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/products' do
  @products = Product.all()
  @manufacturers = Manufacturer.all()
  erb ( :"products/index" )
end

get '/products/new' do
  # @products = Product.all()
  @manufacturers = Manufacturer.all()
  erb(:"products/new")
end


get '/products/:id' do
  @product = Product.find(params[:id].to_i)
  erb(:"products/show")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  erb(:"products/create")
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
