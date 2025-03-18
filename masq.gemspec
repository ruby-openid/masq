# Get the GEMFILE_VERSION without *require* "my_gem/version", for code coverage accuracy
# See: https://github.com/simplecov-ruby/simplecov/issues/557#issuecomment-2630782358
# Kernel.load because load is overloaded in RubyGems during gemspec evaluation
Kernel.load("lib/masq/version.rb")
gem_version = Masq::Version::VERSION
Masq::Version.send(:remove_const, :VERSION)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  # Linux distros may package ruby gems differently,
  #   and securely certify them independently via alternate package management systems.
  # Ref: https://gitlab.com/oauth-xx/version_gem/-/issues/3
  # Hence, only enable signing if the cert_file is present.
  # See CONTRIBUTING.md
  default_user_cert = "certs/#{ENV.fetch("GEM_CERT_USER", ENV["USER"])}.pem"
  default_user_cert_path = File.join(__dir__, default_user_cert)
  cert_file_path = ENV.fetch("GEM_CERT_PATH", default_user_cert_path)
  cert_chain = cert_file_path.split(",")
  if cert_file_path && cert_chain.map { |fp| File.exist?(fp) }
    spec.cert_chain = cert_chain
    if $PROGRAM_NAME.end_with?("gem", "rake") && ARGV[0] == "build"
      spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem")
    end
  end

  spec.name = "masq2"
  spec.version = gem_version
  spec.authors = ["Peter Boling", "Dennis Reimann", "Bardoe Besselaar", "Nikita Vasiliev"]
  spec.email = ["peter.boling@gmail.com", "oauth-ruby@googlegroups.com"]

  spec.summary = "Mountable Rails engine that provides OpenID 2.0 server/identity provider functionality"
  spec.description = "Masq2 supports OpenID 2.0 and supports SReg, AX (fetch and store requests) and PAPE as well as some custom additions like multi-factor authentication using a yubikey"
  spec.homepage = "https://github.com/oauth-xx/masq2"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7"

  spec.metadata["homepage_uri"] = "https://railsbling.com/tags/#{spec.name}/"
  spec.metadata["source_code_uri"] = "#{spec.homepage}/tree/v#{spec.version}"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/#{spec.name}/#{spec.version}"
  spec.metadata["wiki_uri"] = "#{spec.homepage}/wiki"
  spec.metadata["mailing_list_uri"] = "https://groups.google.com/g/oauth-ruby"
  spec.metadata["funding_uri"] = "https://liberapay.com/pboling"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir[
    # Files (alphabetical)
    "{app,config,db,lib}/**/*",
  ]
  # Automatically included with gem package, no need to list again in files.
  spec.extra_rdoc_files = Dir[
    # Files (alphabetical)
    "CHANGELOG.md",
    "CODE_OF_CONDUCT.md",
    "CONTRIBUTING.md",
    "LICENSE.txt",
    "README.md",
    "SECURITY.md",
  ]
  spec.rdoc_options += [
    "--title",
    "#{spec.name} - #{spec.summary}",
    "--main",
    "README.md",
    "--line-numbers",
    "--inline-source",
    "--quiet",
  ]
  spec.require_paths = ["lib"]

  spec.add_dependency("erb")
  spec.add_dependency("i18n_data")
  spec.add_dependency("rails", ">= 5.2.8.1")
  spec.add_dependency("ruby-openid2", "~> 3.1")
  spec.add_dependency("ruby-yadis")
  spec.add_dependency("version_gem", "~> 1.1", ">= 1.1.6")
  spec.add_dependency("yubikey")

  # Development Tasks
  spec.add_development_dependency("rake", "~> 13.0")                          # ruby >= 2.2

  # Testing
  spec.add_development_dependency("rails-controller-testing", "~> 1.0", ">= 1.0.5")

  # Linting - rubocop-lts v18 is a rubocop wrapper for Ruby >= 2.7,
  #   and should only be bumped when dropping old Ruby support
  # see: https://rubocop-lts.gitlab.io
  spec.add_development_dependency("rubocop-lts", ["~> 18.2", ">= 18.2.1"])
end
