$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "masq/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "masq2"
  s.version     = Masq::VERSION
  s.authors     = ["Peter Boling", "Dennis Reimann", "Bardoe Besselaar","Nikita Vasiliev"]
  s.email       = ["peter.boling@gmail.com"]
  s.homepage    = "https://github.com/oauth-xx/masq2"
  s.summary     = "Mountable Rails engine that provides OpenID server/identity provider functionality"
  s.description = "Masq2 supports the current OpenID specifications (OpenID 2.0) and supports SReg, AX (fetch and store requests) and PAPE as well as some custom additions like multi-factor authentication using a yubikey"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency "rails-controller-testing"
  s.add_dependency "ruby-openid"
  s.add_dependency "ruby-yadis"
  s.add_dependency "yubikey"
  s.add_dependency "i18n_data"
end
