require 'minitest_helper'

class TestSinima < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Sinima::VERSION
  end
end
