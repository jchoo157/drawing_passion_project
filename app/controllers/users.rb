get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email], hashed_password: params[:hashed_password])
  @user.password = params[:hashed_password]
  
  if @user.save
  	session["user"] = @user.id
  	redirect "/users/#{@user.id}"
  else
  	redirect "/users/new"
  end
end




