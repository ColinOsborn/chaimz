class Artist < OpenStruct
  # attr_reader :name, :id, :created_at, :updated_at
  # alias_method
  #
  # def initialize(new_artist_hash)
  #   @name = new_artist_hash["name"]
  #   @id = new_artist_hash["id"]
  #   @created_at = new_artist_hash["created_at"]
  #   @updated_at = new_artist_hash["updated_at"]
  # end

  def self.service
    @@service ||= ArtistService.new
  end

  def self.all
    # artists_hash = ArtistService.new.get_artists
    artists_hash = service.get_artists

    artists_hash.map do |artist_hash|
      Artist.new(artist_hash)
    end
  end

  def self.find(id)
    # artist_hash = ArtistService.new.show(id)
    # Artist.new(artist.hash)

    # Artist.new(ArtistService.new.get_artist(id))

    artist_hash = service.get_artist(id)
    Artist.new(artist_hash)
  end

  def self.create(artist_hash)
    new_artist_hash = ArtistService.new.post_artist(artist_hash)
    Artist.new(new_artist_hash)
  end

  def update(artist_hash)
    updated_artist_hash = Artist.service.patch_artist(id, artist_hash)
    Artist.new(updated_artist_hash)
  end

end
