require "sinatra"
require "sinatra/reloader"
require "http"

def get_random_anime_list
  api_url = "https://api.jikan.moe/v4/random/anime"
  anime_list = []

  3.times do
    data = HTTP.get(api_url)
    parsed_data = JSON.parse(data)
    anime_data = parsed_data["data"]
    anime_list.push(anime_data)
  end
  return anime_list

end

get("/") do
  @anime_list = get_random_anime_list
  erb(:random)
end
