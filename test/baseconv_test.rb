require "test_helper"

class BaseconvTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Baseconv::VERSION
  end

  def test_that_we_can_convert_numbers
    assert_equal "1100100", Baseconv.convert("100", from_base: 10, to_base: 2)
    assert_equal "100", Baseconv.convert("1100100", from_base: 2, to_base: 10)
    assert_equal "144", Baseconv.convert("100", from_base: 10, to_base: 8)
    assert_equal "100", Baseconv.convert("144", from_base: 8, to_base: 10)
    assert_equal "64", Baseconv.convert("100", from_base: 10, to_base: 16)
    assert_equal "100", Baseconv.convert("64", from_base: 16, to_base: 10)
    assert_equal "2s", Baseconv.convert("100", from_base: 10, to_base: 36)
    assert_equal "100", Baseconv.convert("2s", from_base: 36, to_base: 10)
    assert_equal "1C", Baseconv.convert("100", from_base: 10, to_base: 62)
    assert_equal "100", Baseconv.convert("1C", from_base: 62, to_base: 10)
  end
end
