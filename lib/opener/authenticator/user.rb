require 'active_record'

module Opener
  class Authenticator
    class User < ActiveRecord::Base
       
       validates_uniqueness_of :secret
       validates_presence_of :token
       
       before_save :encrypt_token
       
       def encrypt_token
         self.token = Digest::SHA1.hexdigest(token)
       end
    end
  end
end