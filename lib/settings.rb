class Settings
  def self.method_missing(name)
    fail "not implemented: #{name}" unless config.respond_to?(name)
    config.public_send(name)
  end

  def self.respond_to?(name)
    config.respond_to?(name)
  end

  def self.frontend_url
    "#{frontend_proto}://#{frontend_host}"
  end

  def self.config
    @config ||= OpenStruct.new Rails.application.config_for(:settings)
  end
end
