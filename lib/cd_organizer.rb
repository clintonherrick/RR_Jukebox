class Cd
  @@cds = []


  define_method(:initialize) do |artist, album, year|
    @artist = artist
    @album = album
    @year = year
    @id = @@cds.length().+(1)
  end

  define_method(:artist) do
    @artist
  end

  define_method(:id) do
    @id
  end

  define_method(:album) do
    @album
  end

  define_method(:year) do
    @year
  end

  define_singleton_method(:all) do
    @@cds
  end

  define_method(:save) do
     @@cds.push(self)
  end

  define_singleton_method(:clear) do
    @@cds = []
  end

  define_singleton_method(:find) do |identification|
    found_cd = nil
    @@cds.each() do |cd|
      if cd.id().eql?(identification.to_i())
        found_cd = cd
      end
    end

    found_cd
  end


end
