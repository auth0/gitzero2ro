require 'rack'
require 'uri'
require 'net/http'
require 'base64'

module Grack
  class Auth0RO
    def initialize(app, options)
      @app = app
      @options = options
    end

    def call(env)
      unless env['HTTP_AUTHORIZATION']
        return unauthorized(env)
      end

      unless header = /Basic\s(.*)/.match(env['HTTP_AUTHORIZATION'])
        return unauthorized(env)
      end

      username, password = Base64.decode64(header[1]).split(":")

      return authenticate(env, username, password)
    end


    private
      def unauthorized(env)
        [401, {
          "Content-Type" => "text/html",
          "WWW-Authenticate" => "Basic"
        }, [ 'Access denied' ]]
      end

      def reject(env)
        [403, { }, [ 'Access denied' ]]
      end

      def authenticate(env, username, password)
        url = URI.parse("https://#{@options[:namespace]}/oauth/ro")
        res = Net::HTTP.post_form(url, {
          'grant_type' => 'password',
          'username'   => username,
          'password'   => password,
          'client_id'  => @options[:client_id],
          'connection' => @options[:connection]
        })

        if res.code == '200'
          @app.call(env)
        else
          reject(env)
        end
      end
  end
end