require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb ( :"manufacturers/index" )
end

get '/manufacturers/new' do
  # @products = Product.all()
  # @manufacturers = Manufacturer.all()
  erb(:"manufacturers/new")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  erb(:"manufacturers/show")
end

post '/manufacturers' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  erb(:"manufacturers/create")
end
