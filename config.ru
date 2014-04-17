$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

use Rack::ShowExceptions

require 'grack'
require 'git_adapter'
require 'auth0_jwt'

config = {
  :project_root => "./examples/test-bare.git",
  :adapter => Grack::GitAdapter,
  :git_path => '/usr/bin/git',
  :upload_pack => true,
  :receive_pack => true,
}

use Grack::Auth0JWT, { :secret => "<your auth0 secret>" }

run Grack::App.new(config)
