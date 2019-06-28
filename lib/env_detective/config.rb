require "logger"

module EnvDetective
  class Config
    CONFIGURABLE_KEYS = %i(
      logger
      allow_duplicate_logging
    ).freeze

    attr_writer *CONFIGURABLE_KEYS

    def logger
      @logger || ::Logger.new(STDOUT)
    end

    def allow_duplicate_logging
      @allow_duplicate_logging || false
    end
  end
end
