require 'sinatra'

require File.expand_path('../../../../config/database', __FILE__)

module Opener
  class Authenticator
    class Server < Sinatra::Base
      get '/' do
        authenticate!
      end
      
      def protected
      
      def authenticate!
        return if authenticated?
        halt 401, "Not authorized\n"        
      end
      
      def authenticated?
        User.exists?(:username => params[:username], :password => Digest::SHA1.hexdigest(params[:password]))
      end
    end # Server
  end # Authenticator
end # Opener
