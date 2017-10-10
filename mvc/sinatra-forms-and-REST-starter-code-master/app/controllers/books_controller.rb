class BooksController < Sinatra::Base
  set :views, 'app/views'

  # index route
  get '/books' do
    @books = Book.all
    erb :'books/index.html'
  end

  # PUT STATIC ROUTES BEFORE DYNAMIC ROUTES

  # new route
  get '/books/new' do
    erb :'books/create.html'
  end

  # show route
  get '/books/:id' do
    @book = Book.find(params["id"])
    erb :'books/show.html'
  end


  # method override for using something other than POST or GET like PATCH
  # ex: <input hidden="true" name="_method" value="patch">

  # create patch '/books/:id' ...


end
