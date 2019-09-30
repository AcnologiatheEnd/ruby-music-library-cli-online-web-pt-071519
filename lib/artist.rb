class Artist
  attr_reader :songs
  attr_accessor :name

  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    save
    @songs = []
  end
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Artist.new(name)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    songs.map do |song|
      song.genre
    end.uniq
  end  
end