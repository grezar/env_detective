module EnvDetective
  class Extension
    RETREIVE_METHODS = %i([] fetch)

    def initialize(env)
      @env = env
    end

    def respond_to_missing?(method_name, include_private = false)
      RETREIVE_METHODS.include?(method_name)
    end

    def method_missing(method_name, *args, &block)
      puts "#{args} is referred at #{caller.first}" if respond_to_missing?(method_name)
      @env.__send__(method_name, *args, &block)
    end
  end
end
