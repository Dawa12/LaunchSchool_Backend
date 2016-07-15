require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'

configure do
  enable :sessions # allow sessions will help us create a persistent state
  set :secret_session, 'secret'
end

before do
  session[:lists] ||= []
end

get '/' do
  redirect '/lists'
end

get '/lists' do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

get '/lists/new' do
  erb :new_list, layout: :layout
end

get '/lists/modify' do
  @modify = ''
  erb :modify, layout: :layout
end

post '/lists' do
  list_name = params[:list_name].strip

  def error_for_list_name(name)
    if !(1..100).cover?(name.size)
      'Please enter between 1 to 100 characters'
    elsif session[:lists].any? { |list| list[:name] == name }
      'This list name must be unique!'
    end
  end

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = 'This list has successfully been created!'
    redirect '/lists'
  end
end

get '/lists/:id' do
  id = params[:id].to_i
  @list = session[:lists][id]
  erb :list, layout: :layout
end

get '/lists/:id/edit' do
  id = params[:id].to_i
  @list = session[:lists][id]
  erb :edit_list, layout: :layout 
end

post '/lists/:id' do
  id = params[:id].to_i
  @list = session[:lists][id]
  list_name = params[:list_name].strip

  def error_for_list_name(name)
    if !(1..100).cover?(name.size)
      'Please enter between 1 to 100 characters'
    elsif session[:lists].any? { |list| list[:name] == name }
      'This list name must be unique!'
    end
  end

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = 'This list has successfully been updateds!'
    redirect "/lists/#{id}"
  end
end

post "/lists/:id/destroy" do
  id = params[:id].to_i
  session[:lists].delete_at(id)
  session[:success] = "The list has been deleted"
  redirect "/lists"
end

# Add a new todo to a list
post "/lists/:list_id/todos" do
  # naming list_id instead of just id, to add clarity
  list_id = params[:list_id].to_i
  list = session[:lists][list_id]
  list[:todos] << {name: params[:todo], completed: false}
  session[:success] = "The todo was added"
  redirect "/lists/#{list_id}"

# comments
# comment 2
end







