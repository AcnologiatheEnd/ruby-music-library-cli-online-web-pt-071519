class Song
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Song.new(name)
  end
  
  def self.destroy_all
    @@all.clear
  end

  # the .add_song method cannot be used on nil values or any method. this is why we use unless 
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre == nil
  end
    
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
    
  def self.new_from_filename(file)
    artist, song, genre = file.split(" - ")
    song_artist = Artist.find_or_create_by_name(artist)
    song_genre = Genre.find_or_create_by_name(genre.gsub(".mp3", ""))
    new_song = Song.new(song,song_artist,song_genre)
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).tap {|song| song.save}
    #could also do: song = self.new_from_filename(file)
    #song.save
  end
    
end