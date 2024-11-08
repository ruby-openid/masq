$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "masq/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "masq"
  s.version     = Masq::VERSION
  s.authors     = ["Peter Boling", "Bardoe Besselaar","Nikita Vasiliev", "Dennis Reimann"]
  s.email       = ["peter.boling@gmail.com"]
  s.homepage    = "https://github.com/VitalConnectInc/masq"
  s.summary     = "Mountable Rails engine that provides OpenID server/identity provider functionality"
  s.description = "Masq supports the current OpenID specifications (OpenID 2.0) and supports SReg, AX (fetch and store requests) and PAPE as well as some custom additions like multifactor authentication using a yubikey"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.1.0"
  s.add_dependency "erb"
  s.add_dependency "rails-controller-testing"
  s.add_dependency "ruby-openid"
  s.add_dependency "ruby-yadis"
  s.add_dependency "yubikey"
  s.add_dependency "i18n_data"
end
