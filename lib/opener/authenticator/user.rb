require 'active_record'

module Opener
  class Authenticator
    class User < ActiveRecord::Base
       
       validates_uniqueness_of :username
       validates_presence_of :password
       
       before_save :encrypt_password
       
       def encrypt_password
         self.password = Digest::SHA1.hexdigest(password)
       end
    end
  end
end