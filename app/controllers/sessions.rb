get '/sessions' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:hashed_password])
  if @user
    session["user"] = @user.id
    redirect "users/#{@user.id}"
  else
    redirect "/sessions"
  end
end

delete '/sessions' do
  session["user"] = nil
  redirect '/'
end

