require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')

get('/') do
  erb(:index)
end

get('/cd') do
  @cds = Cd.all()
  erb(:cd)
end

get('/cd/new') do
  erb(:cd_form)
end


post('/cd') do
  artist = params.fetch("artist")
  album = params.fetch("album")
  year = params.fetch("year")
  @cd = Cd.new(artist, album, year)
  @cd.save()
  erb(:success)
end


get('/cd/:id') do
  @cd = Cd.find(params.fetch('id'))
  erb(:cd)
end
