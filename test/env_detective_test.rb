require "test_helper"

class EnvDetectiveTest < Minitest::Test
  def setup
    @old = ENV.delete('EXIST_KEY')
  end

  def teardown
    ENV.update('EXIST_KEY' => @old) if @old
  end

  def test_that_it_has_a_version_number
    refute_nil ::EnvDetective::VERSION
  end

  def test_that_ENV_responds_to_rtrieve_method
    assert_respond_to ENV, :[]
  end

  def test_that_ENV_responds_to_fetch
    assert_respond_to ENV, :fetch
  end

  def test_that_ENV_retrieve_method_returns_correct_value_if_the_named_variable_exist
    ENV.update('EXIST_KEY' => '1')
    assert ENV['EXIST_KEY'] == '1'
  end

  def test_that_ENV_fetch_returns_correct_value_without_default_value_if_the_named_variable_exist
    ENV.update('EXIST_KEY' => '1')
    assert ENV.fetch('EXIST_KEY') == '1'
  end

  def test_that_ENV_fetch_returns_default_value_if_the_named_variable_does_not_exist
    ENV.delete('EXIST_KEY')
    assert ENV.fetch('EXIST_KEY', 'DEFAULT_VALUE') == 'DEFAULT_VALUE'
  end

  def test_that_ENV_retrieve_method_returns_nil_if_the_named_variable_does_not_exist
    assert ENV['NON_EXIST_KEY'].nil?
  end

  def test_that_ENV_fetch_raises_KeyError_if_the_named_variable_does_not_exist_and_neither_default_value_nor_a_block_provided
    assert_raises(KeyError) { ENV.fetch('NON_EXIST_KEY') }
  end
end
