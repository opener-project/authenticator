require File.expand_path('../lib/opener/authenticator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name                  = 'opener-authenticator'
  gem.version               = Opener::Authenticator::VERSION
  gem.authors               = ['giannismelidis@olery.com']
  gem.summary               = 'Simple authentication endpoint for the Opener Web Services.'
  gem.description           = gem.summary
  gem.homepage              = "http://opener-project.github.com/"
  gem.has_rdoc              = 'yard'
  gem.required_ruby_version = '>= 1.9.2'

  gem.files       = `git ls-files`.split("\n")
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files  = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency 'builder', '~>3.0.0'
  gem.add_dependency 'sinatra', '~>1.4.2'
  gem.add_dependency 'httpclient'
  
  if RUBY_PLATFORM === "java"
    gem.add_dependency 'jdbc-mysql'
    gem.add_dependency 'activerecord-jdbcmysql-adapter'
  else
    gem.add_dependency 'mysql2'
  end
  
  gem.add_dependency 'activerecord', '~>3.2'
  gem.add_dependency 'activesupport', '~>3.2'
  gem.add_dependency 'puma'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
end
