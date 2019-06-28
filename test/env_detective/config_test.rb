require "test_helper"

module EnvDetective
  class ConfigTest < Minitest::Test
    class StubbedLogger ; end

    attr_reader :config

    def setup
      @config = EnvDetective::Config.new
    end

    def test_that_respond_to_logger_writer
      assert_respond_to config, :logger=
    end

    def test_that_respond_to_allow_duplicate_logging_writer
      assert_respond_to config, :allow_duplicate_logging=
    end

    def test_that_respond_to_logger
      assert_respond_to config, :logger
    end

    def test_that_respond_to_allow_duplicate_logging
      assert_respond_to config, :allow_duplicate_logging
    end

    def test_that_logger_retuns_logger_if_setted
      config.logger = StubbedLogger.new
      assert config.logger.class == StubbedLogger
    end

    def test_that_logger_retuns_default_logger_if_not_setted
      config.logger = nil
      assert config.logger.class == ::Logger
    end

    def test_that_allow_duplicate_logging_returns_true_if_setted_to_true
      config.allow_duplicate_logging = true
      assert config.allow_duplicate_logging
    end

    def test_that_allow_duplicate_logging_returns_false_if_not_setted
      config.allow_duplicate_logging = nil
      refute config.allow_duplicate_logging
    end
  end
end
