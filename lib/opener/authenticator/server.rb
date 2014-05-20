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
        return false unless params[:secret] && params[:token]
        User.exists?(:secret => params[:secret], :token => Digest::SHA1.hexdigest(params[:token]))
      end
    end # Server
  end # Authenticator
end # Opener
