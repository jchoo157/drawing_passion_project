get '/drawings' do
  @user_drawings = User.find(session["user"]).drawings
  erb :'drawings/index'
end

get '/drawings/new' do
  erb :'drawings/new'
end

get '/drawings/:image_id' do
  @drawing = Drawing.find(params[:image_id])
  erb :'drawings/show'
end

post '/drawings' do
  @drawing = Drawing.new(title: params[:title], image_url: params[:image], user_id: session["user"])
  if request.xhr?
  	if @drawing.save
  	  redirect "/drawings/#{@drawing.id}"
  	end
  else
    redirect '/drawings'
  end
end

delete '/drawings/:image_id' do
  @drawing = Drawing.find(params[:image_id])
  @drawing.destroy
  redirect '/'
end