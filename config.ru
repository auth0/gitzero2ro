require './lib/grack'
require './lib/git_adapter'
require './lib/auth0_jwt'

require 'rack'
require 'dotenv'
Dotenv.load

use Rack::Static, :urls => ["/login.html", "/js"], :root => "public"

use Rack::ShowExceptions

config = {
  :project_root => "./examples/test-bare.git",
  :adapter => Grack::GitAdapter,
  :git_path => '/usr/bin/git',
  :upload_pack => true,
  :receive_pack => true,
}

use Grack::Auth0JWT, {
  :namespace     => ENV["AUTH0_NAMESPACE"],
  :client_id     => ENV["AUTH0_CLIENT_ID"],
  :client_secret => ENV["AUTH0_CLIENT_SECRET"]
}

run Grack::App.new(config)
