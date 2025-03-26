require "digest/sha1"

module Masq
  class Signup
    attr_accessor :account

    class << self
      def create_account!(attrs = {})
        factory = new(attrs)
        factory.send(:create_account!)
        factory
      end
    end

    def succeeded?
      !account.new_record?
    end

    def send_activation_email?
      Masq::Engine.config.masq["send_activation_mail"]
    end

    protected

    def initialize(attrs = {})
      self.account = Masq::Account.new(attrs)
    end

    def create_account!
      return false unless account.valid?

      make_activation_code if send_activation_email?
      account.save!
      make_default_persona
      if send_activation_email?
        Masq::AccountMailer.signup_notification(account).deliver_now
      else
        account.activate!
      end
      account
    end

    def make_activation_code
      account.activation_code = Digest::SHA1.hexdigest(Time.now.to_s.split("").sort_by { rand }.join)
    end

    def make_default_persona
      account.public_persona = account.personas.build(title: "Standard", email: account.email)
      account.public_persona.deletable = false
      account.public_persona.save!
    end
  end
end
