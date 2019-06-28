require "test_helper"

class EnvDetectiveTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EnvDetective::VERSION
  end
end
