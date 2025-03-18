Masq::Engine.configure do
  config_file_path = Rails.root.join("config", "masq.yml")
  parsed_erb = ERB.new(config_file_path.read).result
  config.masq = YAML.safe_load(parsed_erb, aliases: true)[Rails.env]
end
