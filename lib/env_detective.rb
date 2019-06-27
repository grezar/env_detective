require "env_detective/version"
require "env_detective/extension"
require "env_detective/config"

module EnvDetective
  module ClassMethods
    def configure(&block)
      block.call(config)
    end

    def extend(original)
      Extension.new(original)
    end

    def config
      @config ||= Config.new
    end
  end
  extend ClassMethods
end
