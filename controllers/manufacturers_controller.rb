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

post '/manufacturers/results' do
  @search_term = params[:search_term]
  @manufacturers = Manufacturer.search_manufacturers(params[:search_term])
  erb(:"manufacturers/results")
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

get '/manufacturers/:id/edit' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  # @manufacturers = Manufacturer.all()
  erb(:"manufacturers/edit")
end

post '/manufacturers/:id' do
  Manufacturer.new(params).update
  redirect to '/manufacturers'
end
