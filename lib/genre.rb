class Genre
  
  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Genre.new(name)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    song.genre = self unless song.genre
    @songs << song unless @songs.include?(song)
  end
  
  def artists
    songs.map do |song|
      song.artist
    end.uniq
  end  
  
end