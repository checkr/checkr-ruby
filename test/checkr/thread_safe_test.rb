require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class ThreadSafeTest < Test::Unit::TestCase

    def before_test
      @output = ["[Main thread] #{::Checkr.api_key}"]

      Thread.new do
        @output << "[Thread 1] #{::Checkr.api_key}"
        ::Checkr.api_key = 'changed by thread 1'
        sleep 0.05
        @output << "[Thread 1] #{::Checkr.api_key}"
      end

      Thread.new do
        sleep 0.05
        @output << "[Thread 2] #{::Checkr.api_key}"
        ::Checkr.api_key = 'changed by thread 2'
        @output << "[Thread 2] #{::Checkr.api_key}"
        sleep 0.2
        @output << "[Thread 2] #{::Checkr.api_key}"
      end

      Thread.new do
        sleep 0.25
        @output << "[Thread 3] #{::Checkr.api_key}"
      end

      sleep 0.1

      @output << "[Main thread] #{::Checkr.api_key}"

      sleep 0.05

      ::Checkr.api_key = 'changed by main thread'
      @output << "[Main thread] #{::Checkr.api_key}"
      sleep 0.2
    end

    should 'be defined on main thread' do
      assert_true(@output.include?('[Main thread] foo'))
    end

    should 'fall back to main thread withing a child thread' do
      assert_true(@output.include?('[Thread 1] foo'))
    end

    should 'not be changed by thread 1 in main thread' do
      assert_false(@output.include?('[Main thread] changed by thread 1'))
    end

    should 'not be changed by thread 2 in main thread' do
      assert_false(@output.include?('[Main thread] changed by thread 2'))
    end

    should 'be changeable by main thread' do
      assert_true(@output.include?('[Main thread] changed by main thread'))
    end

    should 'not change child thread if changed in main thread' do
      assert_false(@output.include?('[Thread 2] changed by main thread'))
    end

    should 'be changeable within thread 1' do
      assert_true(@output.include?('[Thread 1] changed by thread 1'))
    end

    should 'be changeable within thread 2' do
      assert_true(@output.include?('[Thread 2] changed by thread 2'))
    end

    should 'bubble down to thread 3 if changed in main and not defined on thread' do
      assert_true(@output.include?('[Thread 3] changed by main thread'))
    end

  end
end
