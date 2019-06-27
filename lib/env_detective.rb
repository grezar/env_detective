require "env_detective/version"
require "env_detective/extension"
require "env_detective/config"
require "env_detective/logger"
require "env_detective/repository"

module EnvDetective
  module ClassMethods
    def configure(&block)
      block.call(config)
    end

    def extend(origin)
      Extension.new(origin)
    end

    def config
      @config ||= Config.new
    end
  end
  extend ClassMethods
end
