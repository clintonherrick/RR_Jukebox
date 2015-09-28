class Jukebox
  @@jukeboxes = []

  define_method(:initialize) do |name|
    @name = name
    @id = @@jukeboxes.length().+(1)
    @albums = []
  end

  define_method(:name) do
    @name
  end

  define_method(:id) do
    @id
  end

  define_method(:albums) do
    @albums
  end

  define_singleton_method(:all) do
    @@jukeboxes
  end

  define_method(:save) do
    @@jukeboxes.push(self)
  end

  define_singleton_method(:clear) do
    @@jukeboxes = []
  end

  define_method(:add_cd) do |cd|
    @albums.push(cd)
  end

  define_singleton_method(:find) do |id|
    found_jukebox = nil
    @@jukeboxes.each() do |jukebox|
      if jukebox.id().eql?(id)
        found_jukebox = jukebox
      end
    end

    found_jukebox

  end


end
