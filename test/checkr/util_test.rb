require File.expand_path('../../test_helper', __FILE__)

class TestObj; end

module Checkr
  class TestObj; end

  class UtilTest < Test::Unit::TestCase
    should "symbolize_keys should convert keys to symbols" do
      start = {
        'foo' => 'bar',
        'array' => [{ 'foo' => 'bar' }],
        'nested' => {
          1 => 2,
          :symbol => 9,
          'string' => nil
        }
      }
      finish = {
        :foo => 'bar',
        :array => [{ :foo => 'bar' }],
        :nested => {
          1 => 2,
          :symbol => 9,
          :string => nil
        }
      }

      symbolized = Util.symbolize_keys(start)
      assert_equal(finish, symbolized)
    end

    should 'query_array should convert { :a => "value" } to []' do
      start = { :a => "value" }
      finish = ["a=value"]

      assert_equal(finish, Util.query_array(start))
    end

    should 'query_array should convert { :a => { :b => { :c => "cvalue" } } } to ["a[b][c]=cvalue"]' do
      start = { :a => { :b => { :c => "cvalue" } } }
      finish = ["a[b][c]=cvalue"]

      assert_equal(finish, Util.query_array(start))
    end

    should 'query_array should convert { :a => [1, 2] } to ["a[]=1", "a[]=2"]' do
      start = { :a => [1, 2] }
      finish = ["a[]=1", "a[]=2"]

      assert_equal(finish, Util.query_array(start))
    end

    should 'scope the class in the Checkr namespace' do
      assert_not_equal(::TestObj, Util.constantize(:TestObj))
      assert_equal(Checkr::TestObj, Util.constantize(:TestObj))
    end
  end
end
