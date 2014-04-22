require './lib/grack'
require './lib/git_adapter'
require './lib/auth0_ro'

require 'rack'
require 'dotenv'
Dotenv.load

use Rack::Static, :urls => ["/login.html",
                            "/favicon.ico",
                            "/js",
                            "/img"], :root => "public"

use Rack::ShowExceptions

use Grack::Auth0RO, {
  :namespace     => ENV["AUTH0_NAMESPACE"],
  :client_id     => ENV["AUTH0_CLIENT_ID"],
  :client_secret => ENV["AUTH0_CLIENT_SECRET"],
  :connection    => ENV["AUTH0_CONNECTION"]
}

config = {
  :project_root => "./examples/test-bare.git",
  :adapter => Grack::GitAdapter,
  :git_path => '/usr/bin/git',
  :upload_pack => true,
  :receive_pack => true,
}

run Grack::App.new(config)
