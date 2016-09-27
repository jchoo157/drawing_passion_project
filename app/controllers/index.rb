get '/' do
  @drawings = Drawing.all
  erb :index
end