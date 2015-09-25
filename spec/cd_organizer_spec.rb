require('rspec')
require('cd_organizer')


describe('Cd') do
  before ()do
    Cd.clear()
 end

  describe('#artist') do
   it('returns the name of the artist') do
     test_cd= Cd.new("Prince", "Purple Rain", 1984)
     test_cd.save()
     expect(test_cd.artist()).to(eq("Prince"))
   end
  end

  describe('#album') do
   it('returns the name of the album') do
     test_cd= Cd.new("Prince", "Purple Rain", 1984)
     test_cd.save()
     expect(test_cd.album()).to(eq("Purple Rain"))
   end
  end

  describe('#year') do
    it('returns the year the album was released') do
      test_cd= Cd.new("Prince", "Purple Rain", 1984)
      test_cd.save()
      expect(test_cd.year()).to(eq(1984))
    end
  end

  describe(".all") do
    it("is empty at first but then it isnt cause its cool") do
      expect(Cd.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a cd to the array of saved information") do
      test_cd = Cd.new("Eminem", "Slim Shady LP", 1999)
      test_cd.save()
      expect(Cd.all()).to(eq([test_cd]))
    end
  end

  describe(".clear") do
    it("makes it all go away yo") do
      Cd.new("Eminem", "Slim Shady LP", 1999).save()
      Cd.clear()
      expect(Cd.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the album") do
      test_cd = Cd.new("Prince", "Purple Rain", 1984)
      test_cd.save()
      expect(test_cd.id()).to(eq(1))
    end
  end

  describe(".find") do
    it ("returns the album by its id number") do
      test_cd = Cd.new("Prince", "Purple Rain", 1984)
      test_cd.save()
      test_cd2 = Cd.new("Eminem", "Slim Shady LP", 1999)
      test_cd2.save()
      expect(Cd.find(test_cd.id())).to(eq(test_cd))
    end
  end

end
