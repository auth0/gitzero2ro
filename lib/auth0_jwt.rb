require 'jwt'
require 'rack'
require 'base64'

module Grack
  class Auth0JWT
    def initialize(app, options)
      @app = app
      @options = options
      @secret = Base64.decode64(@options[:secret].gsub('-', '+').gsub('_','/'))
    end

    def unauthorized(env)
      [401, {
        "Content-Type" => "text/html",
        "WWW-Authenticate" => "Basic realm=\"I need your token\""
      }, [ 'Wrong!!!' ]]
      #so sad that git doesn't display the realm.
    end

    def call(env)
      unless env['HTTP_AUTHORIZATION'] and header = /Basic\s(.*)/.match(env['HTTP_AUTHORIZATION'])
        return unauthorized(env)
      end

      token = Base64.decode64(header[1]).chomp(":")

      begin
        decoded = JWT.decode(token, @secret)
        env["USER"] = decoded
        return @app.call(env)
      rescue Exception => e
        puts e
        return unauthorized(env)
      end
    end

  end
end