class ArtistService

  def initialize
    @connection = Faraday.new("https://my-chaimz.herokuapp.com")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_artists
    # connection = Faraday.new("https://my-chaimz.herokuapp.com")
    # connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
    response = @connection.get("/api/v1/artists.json")
    JSON.parse(response.body)
  end

  def get_artist(id)
    # connection = Faraday.new("https://my-chaimz.herokuapp.com")
    # connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
    response = @connection.get("/api/v1/artists/#{id}.json")
    # JSON.parse(response.body)
    parse(response)
  end

  def post_artist(artist_hash)
    # connection = Faraday.new("https://my-chaimz.herokuapp.com")
    # connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
    response = @connection.post("/api/v1/artists?name=#{artist_hash['name']}")
    # JSON.parse(response.body)
    parse(response)
  end

  def patch_artist(id, artist_hash)
    response = @connection.patch("api/v1/artists/#{id}.json?name=#{artist_hash['name']}")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
