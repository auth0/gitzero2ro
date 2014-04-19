require 'jwt'
require 'rack'
require 'base64'
require 'uri'
require './lib/grack'

#
# This was an interesting idea:
# Since I can't show a messaget for the unauthorized user,
# I tried instead of returning 401, pointing to a dummy repository.
#
# For the push operation, I can show a custom message using a
# post-receive hook, the problem is that the hook is executed **after**
# the client has pushed all the refs. So, an attacker can bloat the
# server's memory.
#
# There isn't hooks for fetches, I can return info in the dummy repo
# but this will mess up the user repository.
#

module Grack
  class DummyOrNot
    def initialize(app)
      @app = app

      dummy_config = {
        :project_root => File.expand_path("../dummy", File.dirname(__FILE__)),
        :adapter      => Grack::GitAdapter,
        :git_path     => '/usr/bin/git',
        :upload_pack  => true,
        :receive_pack => true,
      }

      @dummy_app = Grack::App.new(dummy_config)
    end

    def call(env)
      unless env["USER"]
        response = @dummy_app.call(env)
        return response
      end
      return @app.call(env)
    end

  end
end