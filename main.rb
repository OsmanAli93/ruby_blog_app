require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'bcrypt'

enable :sessions

def run_sql (sql)

  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'blogger'})
  blog = db.exec(sql)
  db.close

  return blog

end 

def logged_in?

  !!session[:id]

end

def user_found (users)

  if users.to_a.length > 0
    users[0]
  else 
    nil
  end

end

def current_user

  user_id = session[:id]
  users = run_sql("SELECT * FROM users WHERE user_id = #{user_id}")
  user = user_found(users)

  return user

end


get '/' do

  posts = run_sql("SELECT * FROM posts")
  
  erb :index, locals: {
    posts: posts
  }
end


get '/login' do
  
  
  erb :'/sessions/login'

end


get '/signup' do

  status = params["status"]

  
  erb :signup, locals: {
    status: status
  }
end

post '/signup/add' do

  first_name = params["first_name"]
  last_name = params["last_name"]
  email = params["email"]
  password = params["password"]
  password_encrypt = BCrypt::Password.create(password)

  run_sql("INSERT INTO users(first_name, last_name, email, password) VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password_encrypt}')")

  redirect '/signup?status=success'

end



post '/submit' do
  
  user_email = params["email"]
  user_password = params["password"]
  
  user = run_sql("SELECT * FROM users WHERE email = '#{user_email}'")[0]

  if user["email"] == user_email && BCrypt::Password.new(user["password"]) == user_password

    session[:id] = user["user_id"]

    redirect '/'
    
  else 

    "FALSE"

  end


end


delete '/logout' do
  
  session[:id] = nil
  
  redirect '/?status=logout'

end


get '/article' do
  
  erb :article

end

post '/article/new' do
  
  user_id = params["user_id"]
  title = params["title"]
  img_url = params["image_url"]
  message = params["editor"]

  run_sql("INSERT INTO posts(user_id, title, image_url, message) values (#{user_id}, '#{title}', '#{img_url}', '#{message}')")

  redirect '/article?status=success'
  

end