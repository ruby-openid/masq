# external gems
require "version_gem"

# this library's version
require_relative "masq/version"

require_relative "masq/engine"
require_relative "masq/authenticated_system"
require_relative "masq/openid_server_system"
require_relative "masq/active_record_openid_store/association"
require_relative "masq/active_record_openid_store/nonce"
require_relative "masq/active_record_openid_store/openid_ar_store"

module Masq
  # Namespace for this library
end

# Ensure version is configured before loading the rest of the library
Masq::Version.class_eval do
  extend VersionGem::Basic
end
