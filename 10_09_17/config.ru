require 'rack'
require 'shotgun'
require 'pry'

class Application
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path == '/'
      resp.write('Welcome')
    elsif req.path == '/about'
      resp.write('This is a web app')
    else
      resp.status = 404
      resp.write('Sorry, not a thing')
    # ^ these replace this below:

    #[200, {'Content-Type' => 'text/html'}, ['Hello World! Sweet!']] #can't pass symbol

    resp.write('hello')

    resp.finish

  end
end

run Application.new
