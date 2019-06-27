module EnvDetective
  class Config
    CONFIGURABLE_KEYS = %i(
      logger
    ).freeze

    attr_writer *CONFIGURABLE_KEYS

    def logger
      @logger || Logger.new(STDOUT)
    end
  end
end
