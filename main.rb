require 'sinatra'
require 'sinatra/reloader' if development?

def run_sql (sql)

  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'blogger'})
  blog = db.exec(sql)
  db.close

  return blog

end 


get '/' do
  erb :index
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




