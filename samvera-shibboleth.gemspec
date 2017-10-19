$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "samvera/shibboleth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "samvera-shibboleth"
  s.version     = Samvera::Shibboleth::VERSION
  s.authors     = ["Aaron Collier"]
  s.email       = ["aaron.collier@stanford.edu"]
  s.homepage    = "http://samvera.github.io"
  s.summary     = "Gem to apply shibboleth specific configuration and model updates to Hyrax"
  s.description = "Gem to apply shibboleth specific configuration and model updates to Hyrax"
  s.license     = "Apache-2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency "omniauth-shibboleth"
  s.add_dependency "config"
  
  s.add_development_dependency "sqlite3"
end
