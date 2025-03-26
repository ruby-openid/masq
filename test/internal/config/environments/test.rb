require "version_gem/ruby"

Rails.application.configure do
  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  # if VersionGem::Ruby.gte_minimum_version?("4.1")
  # end
  config.action_mailer.delivery_method = :test

  config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time, ActiveSupport::TimeWithZone, ActiveSupport::TimeZone, ActiveSupport::HashWithIndifferentAccess]
end
