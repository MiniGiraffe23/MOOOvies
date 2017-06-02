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
    description: movie["overview"], poster_url: poster, background_url: background, release_date: movie["release_date"])
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
    poster_url: poster, background_url: background, description: movie["overview"], release_date: movie["release_date"])
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
    poster_url: poster, background_url: background, description: movie["overview"], release_date: movie["release_date"])
  end


  sleep(20)
  for i in 30..60

  puts "#{i}"
  movie = Movie.find(i)

  # movies.each do |movie|

  tmdid = movie.tmdid.to_s

  url = "https://api.themoviedb.org/3/movie/" + tmdid +"?append_to_response=credits&api_key=" + key

  uri = URI(url)

 request = Net::HTTP.get(uri)

  obj = JSON.parse(request)

    obj["credits"]["crew"].each do |dumb|
     if dumb.values_at("job")[0] == "Director"
        movie.director = dumb.values_at("name")[0]
        movie.save
      end
   end
end

  sleep(20)

  for i in 1..29

  puts "#{i}"
  movie = Movie.find(i)

  # movies.each do |movie|

  tmdid = movie.tmdid.to_s

  url = "https://api.themoviedb.org/3/movie/" + tmdid +"?append_to_response=credits&api_key=" + key

  uri = URI(url)

 request = Net::HTTP.get(uri)

  obj = JSON.parse(request)

   obj["credits"]["crew"].each do |dumb|
     if dumb.values_at("job")[0] == "Director"
        movie.director = dumb.values_at("name")[0]
        movie.save
    end
   end

end


  sleep(20)
  for i in 30..60

  puts "#{i}"
  movie = Movie.find(i)

  # movies.each do |movie|

  tmdid = movie.tmdid.to_s

  url = "https://api.themoviedb.org/3/movie/" + tmdid +"/videos?api_key=" + key

  uri = URI(url)

 request = Net::HTTP.get(uri)

  obj = JSON.parse(request)

    obj["results"].each do |dumb|

      if dumb["key"] == nil
      trailer = nil
    else
      trailer = "https://www.youtube.com/watch?v=" + dumb["key"]
    end
      movie.trailer_url = trailer
      movie.save
   end
end

  sleep(20)
  for i in 1..29

  puts "#{i}"
  movie = Movie.find(i)

  # movies.each do |movie|

  tmdid = movie.tmdid.to_s

  url = "https://api.themoviedb.org/3/movie/" + tmdid +"/videos?api_key=" + key

  uri = URI(url)

 request = Net::HTTP.get(uri)

  obj = JSON.parse(request)

    obj["results"].each do |dumb|

    if dumb["key"] == nil
      trailer = nil
    else
      trailer = "https://www.youtube.com/watch?v=" + dumb["key"]
    end
      movie.trailer_url = trailer
      movie.save
   end
end

users = []

users << User.create(first_name: "Bob", last_name: "Jones", email: "bobjones@example.com", password: "movieluvr")

users << User.create(first_name: "Gertrude", last_name: "Gomez", email: "gg@example.com", password: "movieluvr")

users << User.create(first_name: "Mooo", last_name: "Cow", email: "moo@cow.com", password: "movieluvr")


users.each do |user|
  user_movies = Movie.all

  Watchlist.create!(user: user, movie: user_movies.sample)
  Favorite.create!(user: user, movie: user_movies.sample)
  Rating.create!(user: user, movie: user_movies.sample, spots: rand(1..5))
  Comment.create!(user: user, movie: user_movies.sample, body: "Mooo")

end



























