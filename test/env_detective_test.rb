require "test_helper"

class EnvDetectiveTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EnvDetective::VERSION
  end

  def test_that_ENV_responds_to_rtrieve_method
    assert_respond_to ENV, :[]
  end

  def test_that_ENV_responds_to_fetch
    assert_respond_to ENV, :fetch
  end
end
