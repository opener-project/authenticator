require 'sinatra'

require File.expand_path('../../../../config/database', __FILE__)

module Opener
  class Authenticator
    class Server < Sinatra::Base
      get '/' do
        authenticate!
      end
      
      protected
      
      def authenticate!
        return if authenticated?
        halt 401, "Not authorized\n"        
      end
      
      def authenticated?
        return false unless params[:username] && params[:password]
        User.exists?(:username => params[:username], :password => Digest::SHA1.hexdigest(params[:password]))
      end
    end # Server
  end # Authenticator
end # Opener
