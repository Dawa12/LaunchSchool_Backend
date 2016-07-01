require "sinatra"
require "sinatra/reloader"

get "/" do
  redirect "list"
end

get "/list" do
  @file = File.read("users.yaml")
  
  erb :list
end



