class ActiveSupport::TestCase
  # Support for older versions of Rails
  if respond_to?(:fixture_path=)
    self.fixture_path = [File.expand_path("../../../fixtures", __FILE__)]
  else
    self.fixture_paths = [File.expand_path("../../../fixtures", __FILE__)]
  end

  if respond_to?(:fixture_paths=)
    self.fixture_paths = [File.expand_path("../../../fixtures", __FILE__)]
    ActionDispatch::IntegrationTest.fixture_paths = ActiveSupport::TestCase.fixture_paths
    self.file_fixture_path = File.expand_path("../../../fixtures", __FILE__) + "/files"
  elsif respond_to?(:fixture_path=)
    self.fixture_path = File.expand_path("../../../fixtures", __FILE__)
    ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
    self.file_fixture_path = File.expand_path("../../../fixtures/files", __FILE__)
  end

  set_fixture_class accounts: Masq::Account
  set_fixture_class personas: Masq::Persona
  set_fixture_class release_policies: Masq::ReleasePolicy
  set_fixture_class sites: Masq::Site

  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Masq::TestHelper
end
