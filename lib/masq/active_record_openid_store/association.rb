# frozen_string_literal: true

require "openid/association"
require "active_record"

module Masq
  class Association < ActiveRecord::Base
    self.table_name = "masq_open_id_associations"

    # attr_accessible :server_url, :handle, :secret, :issued, :lifetime, :assoc_type

    def from_record
      OpenID::Association.new(handle, secret, issued, lifetime, assoc_type)
    end
  end
end
