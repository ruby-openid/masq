require "rails/engine"

module Masq
  class Engine < ::Rails::Engine
    # An isolated engine will set its name according to namespace,
    #   so Masq::Engine.engine_name will be “masq”.
    # It will also set Masq.table_name_prefix to “masq_”,
    #   changing the MyEngine::Persona model to use the masq_personas table
    # See: http://edgeapi.rubyonrails.org/classes/Rails/Engine.html#label-Isolated+Engine
    isolate_namespace Masq
  end
end
