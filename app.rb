require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')
require('./lib/jukebox')

require('pry')

get('/') do
  erb(:index)
end

########CD##########

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

post('/jukeboxes/:id') do
  artist = params.fetch("artist")
  album = params.fetch("album")
  year = params.fetch("year")
  jukebox_id = params.fetch('id').to_i()

  @cd = Cd.new(artist, album, year)
  @cd.save()
  @jukebox = Jukebox.find(jukebox_id)
  @jukebox.add_cd(@cd)
  @jukeboxes = Jukebox.all()
  erb(:jukeboxes)
end


##############JUKEBOX#############

get ('/jukeboxes/new') do
  erb (:jukeboxes_form)
end

get ('/jukeboxes') do

  @jukeboxes = Jukebox.all()
  erb(:jukeboxes)
end

post ('/jukeboxes') do
  name = params.fetch('name')
  Jukebox.new(name).save()
  @jukeboxes = Jukebox.all()
  erb (:jukeboxes)
end

get('/jukeboxes/:id') do
  @jukebox = Jukebox.find(params.fetch('id').to_i())
  artist = params.fetch("artist")
  album = params.fetch("album")
  year = params.fetch("year")
  jukebox_id = params.fetch('id').to_i()
  erb (:jukebox)
end

get('/jukeboxes/:id/cds/new') do
  @jukebox= Jukebox.find(params.fetch('id').to_i())
  erb(:jukebox_cd_form)
end
