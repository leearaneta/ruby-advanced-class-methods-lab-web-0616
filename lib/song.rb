require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	@@all << Song.new
  	@@all[-1]
  end

  def self.new_by_name(song_name)
  	x = Song.new
  	x.name = song_name
  	x
  end

  def self.create_by_name(song_name)
  	x = Song.new
  	x.name = song_name
  	@@all << x
  	x
  end

  def self.find_by_name(song_name)
  	@@all.find {|instance| instance.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
  	x = @@all.select {|instance|
  		instance.name == song_name}
  	x.size == 0 ? self.create_by_name(song_name) : x.first
  end

  def self.alphabetical
  	@@all.sort_by{|song|song.name}
  end

  def self.new_from_filename(file_name)
  	z = file_name.split(" - ").map {|x| x.split(".")}.flatten
  	song = self.create_by_name(z[1])
  	song.artist_name = z[0]
  	song
  end

  def self.create_from_filename(file_name)
  	@@all << self.new_from_filename(file_name)
  end

  def self.destroy_all
  	@@all = []
  end
end

Song.find_or_create_by_name("Blank Space")
