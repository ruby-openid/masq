# Get the GEMFILE_VERSION without *require* "my_gem/version", for code coverage accuracy
# See: https://github.com/simplecov-ruby/simplecov/issues/557#issuecomment-2630782358
# Kernel.load because load is overloaded in RubyGems during gemspec evaluation
Kernel.load("lib/masq/version.rb")
gem_version = Masq::Version::VERSION
Masq::Version.send(:remove_const, :VERSION)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "masq2"
  spec.version     = gem_version
  spec.authors     = ["Peter Boling", "Dennis Reimann", "Bardoe Besselaar","Nikita Vasiliev"]
  spec.email       = ["peter.boling@gmail.com"]
  spec.homepage    = "https://github.com/oauth-xx/masq2"
  spec.summary     = "Mountable Rails engine that provides OpenID 2.0 server/identity provider functionality"
  spec.description = "Masq2 supports OpenID 2.0 and supports SReg, AX (fetch and store requests) and PAPE as well as some custom additions like multi-factor authentication using a yubikey"

  spec.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  spec.test_files = Dir["test/**/*"]

  spec.add_dependency "version_gem", "~> 1.1", ">= 1.1.6"
  spec.add_dependency "rails", ">= 5.2.8.1"
  spec.add_dependency "erb"
  spec.add_dependency "rails-controller-testing"
  spec.add_dependency "ruby-openid2", "~> 3.1"
  spec.add_dependency "ruby-yadis"
  spec.add_dependency "yubikey"
  spec.add_dependency "i18n_data"
end
