require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animals_controller')
also_reload('./models/*')


get '/' do
  erb( :index )
end
