require "logger"

module EnvDetective
  class Extension
    RETREIVE_METHODS = %i([] fetch).freeze

    attr_reader :origin

    def initialize(origin)
      @origin = origin
    end

    def respond_to_missing?(method_name, include_private = false)
      RETREIVE_METHODS.include?(method_name)
    end

    def method_missing(method_name, *args, &block)
      @logger.info "#{args.first} is referred from #{caller.first}" if respond_to_missing?(method_name)
      origin.__send__(method_name, *args, &block)
    end
  end
end
