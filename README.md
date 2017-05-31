# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.3.0
* Rails version
5.0.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

get '/movies' do

  # have to make sure at least an a entered
  # make sure less than 15 results
  # right now if not return error


  

  key = ENV["TMD_API_KEY"]


  url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=1&api_key=" + key

  uri = URI(url)


  request = Net::HTTP.get(uri)

  obj = JSON.parse(request)


  @search_results = []

  obj["results"].each do |movie|
    if movie["poster_path"] == nil
      poster = nil
    else
      poster = "https://image.tmdb.org/t/p/w640" + movie["poster_path"]
    end
   @search_results << OpenStruct.new(id: movie["id"], title: movie["title"],
    poster_path: poster, release_date: movie["release_date"])
  end
