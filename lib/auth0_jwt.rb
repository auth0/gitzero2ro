require 'jwt'
require 'rack'
require 'base64'
require 'uri'

module Grack
  class Auth0JWT
    def initialize(app, options)
      @app = app
      @options = options
      @secret = Base64.decode64(@options[:client_secret].gsub('-', '+').gsub('_','/'))
    end

    def call(env)
      unless env['HTTP_AUTHORIZATION']
        if env['HTTP_USER_AGENT']['git/']
          return unauthorized(env)
        else
          return init_auth(env)
        end
      end

      unless header = /Basic\s(.*)/.match(env['HTTP_AUTHORIZATION'])
        return reject(env)
      end

      puts "header is #{Base64.decode64(header[1])}"
      token = Base64.decode64(header[1]).chomp(":")
      puts "token is #{token} and secret is #{@secret}"

      begin
        decoded = JWT.decode(token, @secret)
        puts "decoded is #{decoded}"

        env["USER"] = decoded
        return @app.call(env)
      rescue
        return reject(env)
      end
    end


    private
      def unauthorized(env)
        [401, {
          "Content-Type" => "text/html",
          "WWW-Authenticate" => "Basic realm=\"I need your token\""
        }, [ 'Access denied' ]]
        #so sad that git doesn't display the realm.
      end

      def init_auth(env)
        query = URI.encode_www_form({
          :response_type => "token",
          :client_id     => @options[:client_id],
          :redirect_uri  => "#{env["rack.url_scheme"]}://#{env["HTTP_HOST"]}/login.html",
          :scope         => "openid -iss -iat" #openid profile
        })
        return [302, { "Location" => "https://#{@options[:namespace]}/authorize/?" + query, }, [ '' ]]
      end

      def reject(env)
        [403, {}, [ 'Access denied' ]]
      end
  end
end