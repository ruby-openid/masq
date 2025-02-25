# Be sure to restart your server when you modify this file.
#
# This file contains migration options to ease your Rails 5.0 upgrade.
#
# Once upgraded flip defaults one by one to migrate to the new default.
#
# Read the Guide for Upgrading Ruby on Rails for more info on each option.

# Rails.application.config.action_controller.raise_on_unfiltered_parameters = true

# Enable per-form CSRF tokens. Previous versions had false.
Rails.application.config.action_controller.per_form_csrf_tokens = false

# Enable origin-checking CSRF mitigation. Previous versions had false.
Rails.application.config.action_controller.forgery_protection_origin_check = false

# Make Ruby 2.4 preserve the timezone of the receiver when calling `to_time`.
# Previous versions had false.
ActiveSupport.to_time_preserves_timezone = false

# Require `belongs_to` associations by default. Previous versions had false.
Rails.application.config.active_record.belongs_to_required_by_default = false

# Rails 5.2.8.1 is a security patch release to fix CVE-2022-32224.
# See: https://discuss.rubyonrails.org/t/cve-2022-32224-possible-rce-escalation-bug-with-serialized-columns-in-active-record/81017
#
# The patch (Rails v5.2.8.1) causes an error:
#   Psych::DisallowedClass: Tried to load unspecified class: ActiveSupport::HashWithIndifferentAccess
#  when serializing a Hash the way we have done in app/models/masq/open_id_request.rb:
#     serialize :parameters, Hash
#  so we instead switch to serializing as JSON:
#     serialize :parameters, JSON
#
# If an implementation needs to continue using the serialized Hash, then one of the following is needed:
# The simple, but insecure fix, which reverts to previous unpatched behavior is:
#   Rails.application.config.active_record.use_yaml_unsafe_load = true
# The more complex, and a bit less insecure fix, is to explicitly list the allowed classes to serialize:
# Rails.application.config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time, HashWithIndifferentAccess]

