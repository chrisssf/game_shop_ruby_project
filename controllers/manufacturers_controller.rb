require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/manufacturers' do
  @manufacturers = Manufacturer.search_manufacturers("", "no")
  erb ( :"manufacturers/index" )
end

get '/manufacturers/new' do
  erb(:"manufacturers/new")
end

post '/manufacturers/results' do
  @search_term = params[:search_term]
  @manufacturers = Manufacturer.search_manufacturers(params[:search_term], "no")
  @deactivated_manufacturers = Manufacturer.search_manufacturers(params[:search_term], "yes")
  erb(:"manufacturers/results")
end

get '/manufacturers/deactivated' do
  @deactivated_manufacturers = Manufacturer.search_manufacturers("", "yes")
  erb(:"manufacturers/deactivated")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  erb(:"manufacturers/show")
end

post '/manufacturers' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  redirect to '/manufacturers'
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
