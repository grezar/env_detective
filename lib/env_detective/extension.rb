require "logger"

module EnvDetective
  class Extension
    RETREIVE_METHODS = %i([] fetch)

    attr_writer :logger

    def initialize(env)
      @env = env
      @logger = ::Logger.new(STDOUT)
    end

    def respond_to_missing?(method_name, include_private = false)
      RETREIVE_METHODS.include?(method_name)
    end

    def method_missing(method_name, *args, &block)
      @logger.info "#{args} is used at #{caller.first}" if respond_to_missing?(method_name)
      @env.__send__(method_name, *args, &block)
    end
  end
end
