get '/comments/:image_id/new' do
  @drawing = Drawing.find(params[:image_id])
  erb :'comments/new'
end

post '/comments/:image_id' do
  @drawing = Drawing.find(params[:image_id])
  @drawing.comments.create(content: params[:content], user_id: session["user"])
  redirect "/"
end