require('rspec')
require('jukebox')
require('cd_organizer')

describe(Jukebox) do
  before()do
    Jukebox.clear()
  end


  describe('#name') do
    it('returns the name of the jukebox') do
      test_jukebox = Jukebox.new("Charlie's Jukebox")
      expect(test_jukebox.name()).to(eq("Charlie's Jukebox"))
    end
  end

  describe("#add_cd") do
    it('adds a new cd to a jukebox') do
      test_jukebox = Jukebox.new("charlie's jukebox")
      test_cd = Cd.new('eminem', 'shady lp', 1998)
      test_jukebox.add_cd(test_cd)
      expect(test_jukebox.albums()).to(eq([test_cd]))
    end
  end

  describe('#id') do
    it('returns the id of the jukebox') do
    test_jukebox = Jukebox.new("Charlie's Jukebox")
    expect(test_jukebox.id()).to(eq(1))
    end
  end


  describe('#albums') do
    it('returns the name of the album within the jukebox') do
    test_jukebox = Jukebox.new("Charlie's Jukebox")
    expect(test_jukebox.albums()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a album to the array of saved albums') do
      test_jukebox = Jukebox.new("Charlie's Jukebox")
      test_jukebox.save()
      expect(Jukebox.all()).to(eq([test_jukebox]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Jukebox.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all the saved albums") do
      Jukebox.new("Charlie's Jukebox").save()
      Jukebox.clear()
      expect(Jukebox.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a album by id number") do
      test_jukebox = Jukebox.new("Charlie's Jukebox")
      test_jukebox.save()
      test_jukebox2 = Jukebox.new("Char Jukebox")
      test_jukebox2.save()
      expect(Jukebox.find(test_jukebox.id())).to(eq(test_jukebox))

    end
  end

end
