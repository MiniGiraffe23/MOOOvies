require 'uri'
require 'pathname'
require 'net/http'
require 'json'
require 'ostruct'

  key = ENV["TMD_API_KEY"]


  url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=1&api_key=" + key

  uri = URI(url)


  request = Net::HTTP.get(uri)

  obj = JSON.parse(request)


  obj["results"].each do |movie|

    if movie["backdrop_path"] == nil
      background = nil
    else
      background = "https://image.tmdb.org/t/p/w1440_and_h320_bestv2/" + movie["backdrop_path"]
    end

    if movie["poster_path"] == nil
      poster = nil
    else
      poster = "https://image.tmdb.org/t/p/w640" + movie["poster_path"]
    end
   Movie.create!(tmdid: movie["id"], title: movie["title"],
    poster_url: poster, background_url: background, release_date: movie["release_date"])
  end










  url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=2&api_key=" + key

  uri = URI(url)


  request = Net::HTTP.get(uri)

  obj = JSON.parse(request)


  obj["results"].each do |movie|

    if movie["backdrop_path"] == nil
      background = nil
    else
      background = "https://image.tmdb.org/t/p/w1440_and_h320_bestv2/" + movie["backdrop_path"]
    end

    if movie["poster_path"] == nil
      poster = nil
    else
      poster = "https://image.tmdb.org/t/p/w640" + movie["poster_path"]
    end
   Movie.create!(tmdid: movie["id"], title: movie["title"],
    poster_url: poster, background_url: background, release_date: movie["release_date"])
  end












  url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=3&api_key=" + key

  uri = URI(url)


  request = Net::HTTP.get(uri)

  obj = JSON.parse(request)


  obj["results"].each do |movie|

    if movie["backdrop_path"] == nil
      background = nil
    else
      background = "https://image.tmdb.org/t/p/w1440_and_h320_bestv2/" + movie["backdrop_path"]
    end

    if movie["poster_path"] == nil
      poster = nil
    else
      poster = "https://image.tmdb.org/t/p/w640" + movie["poster_path"]
    end
   Movie.create!(tmdid: movie["id"], title: movie["title"],
    poster_url: poster, background_url: background, release_date: movie["release_date"])
  end


  Movie.all
