DISCOGRAPHY = {
  artist:[
    {
      name:'Bob Dylan',
      id:1
    },
    {
      name:'Pink Floyd',
      id:2
    }
  ],
  albums:[
    {
      name: "Animals",
      year:1977,
      artist_id: 2,
      id:2
    },{
      name: "Bringing It All Back Home",
      year:1965,
      artist_id: 1,
      id:1
    }
  ],
  songs:[
    {
      name: "Subterranean Homesick Blues",
      album_id: 1,
      id: 1
    },
    {
      name: "She Belongs to Me",
      album_id: 1,
      id: 2
    },
    {
      name: "Maggie's Farm",
      album_id: 1,
      id: 3
    },
    {
      name: "Love Minus Zero/No Limit",
      album_id: 1,
      id: 4
    },
    {
      name: "Outlaw Blues",
      album_id: 1,
      id: 5
    },
    {
      name: "On the Road Again",
      album_id: 1,
      id: 6
    },
    {
      name: "Bob Dylan's 115th Dream",
      album_id: 1,
      id: 7
    },
    {
      name: "Mr. Tambourine Man",
      album_id: 1,
      id: 8
    },
    {
      name: "Gates of Eden",
      album_id: 1,
      id: 9
    },
    {
      name: "It's Alright, Ma (I'm Only Bleeding)",
      album_id: 1,
      id: 10
    },
    {
      name: "It's All Over Now, Baby Blue",
      album_id: 1,
      id: 11
    },
    {
      name: "Pigs on the Wing 1",
      album_id: 2,
      id: 12
    },
    {
      name: "Dogs",
      album_id: 2,
      id: 13
    },
    {
      name: "Pigs (Three Different Ones)",
      album_id: 2,
      id: 14
    },
    {
      name: "Sheep",
      album_id: 2,
      id: 15
    },
    {
      name: "Pigs on the Wing 2",
      album_id: 2,
      id: 16
    }
  ]
}

class Song
  def initialize(name:, album_id:, id:)
    @name = name
    @album_id = album_id
    @id = id
  end
end

class Album
  attr_reader :id, :songs, :year, :title, :artist_id

  @@data = DISCOGRAPHY
  @@all = []

  def initialize(name:, year:, artist_id:, id:)
    @name = name
    @year = year
    @artist_id = artist_id
    @id = id
    @songs = []
    fetch_songs #def a method and call here rather than fill with clutter
    @@all << self
  end

  def self.all #need to create a class method, not just an attribute
    @@all
  end

  def self.list_by_year
    @@all.sort_by {|album| album.year} #not to be confused with the Album class (this album is the instance)
  end

  def self.list_by_title
    @@all.sort_by {|album| album.title}
  end

  def self.list_by_artist
    @@all.sort_by {|album| album.artist_id}
  end

  def fetch_songs
    songs_data = @@data[:songs].select {|song_hash| song_hash[:album_id] == id}
    songs_data.each do |song_hash|
      @songs << Song.new(song_hash)
    end
  end
end

class Artist
  attr_reader :id, :albums

  @@data = DISCOGRAPHY
  @@artists = []

  def initialize(name:, id:) # use keywords do we can pass the data hash
    @name = name
    @id = id
    @albums = []
  end

  def self.load_by_name(name) #in the class scope w/ self rather than instance scope
    artist_data = @@data[:artist].find {|artist_hash| artist_hash[:name] == name}
    # artist = new(artist_data[:name], artist_data[:id]) # same as Artist.new because we are already in the scope of the class
    @@artists << new(artist_data) #same as above because we have keys, shortcut must have all the same keys (if 2 args, must have 2 key symbols)
    @@artists.last
  end

  def load_discography #instance method because it belongs to an instance of an artist - it's not for all
    albums_data = @@data[:albums].select {|album_hash| album_hash[:artist_id] == self.id}
    @albums = albums_data.collect do |album_hash|
      Album.new(album_hash)
    end
  end
end

# The Artist.new method should use the parameter to lookup the discography hash and instantiate an Artist instance
# with an instance variable for the name and id
pink_floyd = Artist.load_by_name('Pink Floyd') #use this instead of this: pink_floyd = Artist.new('Pink Floyd')
# pink_floyd = Artist.new('Pink Floyd')
bob_dylan = Artist.load_by_name('Pink Floyd')

# The load discography method should lookup the discography hash and instantiate an instance of Album per each artist album.
# The album should have an instance variable for name, year, id and artist id
# The Album initialize method should lookup the discography hash and instantiate an instance of Song for each song associated to the album and save
# a reference to the song a songs instance variable
pink_floyd.load_discography
bob_dylan.load_discography

# The album method should return a collection containing references to the artist albums
pink_floyd.albums
bob_dylan.albums

# The songs album instance method should return a collection of the song instances associated to the album
pink_floyd.albums.first.songs
bob_dylan.albums.first.songs

# All instance variables should have a reader method for each instance attribute
pink_floyd.albums.first.songs.last.name
pink_floyd.albums.first.songs.last.name

# Should return a collection of album instances ordered by year
Album.list_by_year

# Should return a collection of album instances ordered by artist name
Album.list_by_artist

# Should return a collection of album instances ordered by title name
Album.list_by_title
