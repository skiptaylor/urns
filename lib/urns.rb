require 'sinatra/base'
require 'rack'
require 'rack/request'

Dotenv.load

module Urns
  
  class Base < Sinatra::Application
    configure do
      use Rack::rack-SSL
      use Rack::Protection, :except => :session_hijacking
      enable :sessions
      use Rack::Session::Cookie, :key => 'rack.session',
                                 :secret => 'secret123',
                                 :expire_after => ENV.fetch("EXPIRE").to_i
      set :database,       ENV.fetch('DATABASE_URL')
      set :session_secret, ENV.fetch('SESSION_SECRET')
      set :views,          ['./views', "#{File.dirname(__FILE__)}/views"]
    end

    CarrierWave.configure do |config|
      config.fog_credentials = {
        aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
            aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
                     provider: ENV.fetch('PROVIDER')
      }
      config.fog_directory  = ENV.fetch('FOG_DIRECTORY')
    end

    require_rel 'models', 'helpers', 'settings'
    helpers Urns::Helpers
  end

  class App < Base
    require_rel 'routes'
    use Urns::Routes
  end
end

module Rack
  class SSL
    YEAR = 31536000

    def self.default_hsts_options
      { :expires => YEAR, :subdomains => false }
    end

    def initialize(app, options = {})
      @app = app

      @hsts = options[:hsts]
      @hsts = {} if @hsts.nil? || @hsts == true
      @hsts = self.class.default_hsts_options.merge(@hsts) if @hsts

      @exclude = options[:exclude]
      @host    = options[:host]
    end

    def call(env)
      if @exclude && @exclude.call(env)
        @app.call(env)
      elsif scheme(env) == 'https'
        status, headers, body = @app.call(env)
        headers = hsts_headers.merge(headers)
        flag_cookies_as_secure!(headers)
        [status, headers, body]
      else
        redirect_to_https(env)
      end
    end

    private
      # Fixed in rack >= 1.3
      def scheme(env)
        if env['HTTPS'] == 'on'
          'https'
        elsif env['HTTP_X_FORWARDED_PROTO']
          env['HTTP_X_FORWARDED_PROTO'].split(',')[0]
        else
          env['rack.url_scheme']
        end
      end

      def redirect_to_https(env)
        req = Request.new(env)

        host = @host || req.host
        location = "https://#{host}#{req.fullpath}"

        status  = %w[GET HEAD].include?(req.request_method) ? 301 : 307
        headers = { 'Content-Type' => 'text/html', 'Location' => location }

        [status, headers, []]
      end

      # http://tools.ietf.org/html/draft-hodges-strict-transport-sec-02
      def hsts_headers
        if @hsts
          value = "max-age=#{@hsts[:expires]}"
          value += "; includeSubDomains" if @hsts[:subdomains]
          { 'Strict-Transport-Security' => value }
        else
          {}
        end
      end

      def flag_cookies_as_secure!(headers)
        if cookies = headers['Set-Cookie']
          # Rack 1.1's set_cookie_header! will sometimes wrap
          # Set-Cookie in an array
          unless cookies.respond_to?(:to_ary)
            cookies = cookies.split("\n")
          end

          headers['Set-Cookie'] = cookies.map { |cookie|
            if cookie !~ /; secure(;|$)/
              "#{cookie}; secure"
            else
              cookie
            end
          }.join("\n")
        end
      end
  end
end