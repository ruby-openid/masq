module Masq
  class OpenIdRequest < ActiveRecord::Base
    validates_presence_of :token, :parameters

    before_validation :make_token, on: :create

    serialize :parameters, type: Hash, coder: JSON

    def parameters
      self[:parameters]
    end

    def parameters=(params)
      self[:parameters] =
        case params
          # arbitrary params passed as Hash
        when Hash
          params.delete_if { |k, v| k.index("openid.") != 0 }
          # params from ActionController (does not inherit directly from HashWithIndifferentAccess after Rails 4.2)
        when ActionController::Parameters
          params.to_unsafe_h.delete_if { |k, v| k.index("openid.") != 0 }
        end
    end

    def from_trusted_domain?
      host = URI.parse(parameters["openid.realm"] || parameters["openid.trust_root"]).host
      unless Masq::Engine.config.masq["trusted_domains"].nil?
        Masq::Engine.config.masq["trusted_domains"].find { |domain| host.ends_with?(domain) }
      end
    end

    protected

    def make_token
      self.token = Digest::SHA1.hexdigest(Time.now.to_s.split("").sort_by { rand }.join)
    end
  end
end
