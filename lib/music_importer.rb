class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    array = Dir.entries(path)
    array.select {|music| music.include?(".mp3")}
  end
  
  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end