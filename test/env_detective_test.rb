require "test_helper"

class EnvDetectiveTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EnvDetective::VERSION
  end

  def test_that_it_respond_to_configure
    assert_respond_to EnvDetective, :configure
  end

  def test_that_it_respond_to_extend
    assert_respond_to EnvDetective, :extend
  end

  def test_that_it_respond_to_config
    assert_respond_to EnvDetective, :config
  end

  def test_that_configure_sets_a_key
    EnvDetective::Config::CONFIGURABLE_KEYS.each do |key|
      EnvDetective.configure do |config|
        original = config.send(key)
        config.send("#{key}=", key)
        assert EnvDetective.config.send(key), key
        config.send("#{key}=", original)
      end
    end
  end

  def test_that_extend_returns_the_extension_instance
    assert EnvDetective.extend(ENV).class == EnvDetective::Extension
  end

  def test_that_config_returns_the_config_instance
    assert EnvDetective.config.class == EnvDetective::Config
  end
end
