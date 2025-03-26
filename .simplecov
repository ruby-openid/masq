require "kettle/soup/cover/config" # This lives in the kettle-soup-cover gem!
require "minitest/simplecov_plugin" # This lives in the simplecov gem!

Minitest.plugin_simplecov_init({})

SimpleCov.start
