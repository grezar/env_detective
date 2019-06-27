module EnvDetective
  class Logger
    attr_reader :logger, :location, :key, :name

    def initialize(method_name, *args, location)
      @logger = EnvDetective.config.logger
      @location = location
      @key = generate_key(method_name, location)
      @name = get_env_variable_name_from(*args)
    end

    def self.info(method_name, *args, location)
      self.new(method_name, *args, location).info
    end

    def info
      return if Repository.stored?(key)
      Repository.store(key, name)
      logger.info "#{name} is referred from #{location}"
    end

    private

    def generate_key(method_name, location)
      "#{method_name}@#{location}".to_sym
    end

    def get_env_variable_name_from(*args)
      args.first
    end
  end
end
