require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class ProgramTest < Test::Unit::TestCase
    setup do
      @program_url = "#{Checkr.api_base}/v1/programs"
    end

    context 'Program class' do
      should 'be retrieveable' do
        id = 'program_id'
        @mock.expects(:get).once.with("#{@program_url}/#{id}", anything, anything)
          .returns(test_response(test_program))
        program = Program.retrieve(id)
        assert(program.is_a?(Program))
      end
    end

    context 'Program instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@program_url}/#{test_program[:id]}", anything, anything)
          .returns(test_response(test_program))
        program = Program.new(test_program[:id])
        program.refresh
        assert_equal(program.name, test_program[:name])
      end
    end

    context 'Retrieved Program instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_program))
        @program = Program.retrieve('program_id')
      end

      should 'have the id attribute' do
        assert_equal(@program.id, test_program[:id])
      end

      should 'have the object attribute' do
        assert_equal(@program.object, test_program[:object])
      end

      should 'have the uri attribute' do
        assert_equal(@program.uri, test_program[:uri])
      end

      should 'have the created_at attribute' do
        assert_equal(@program.created_at, test_program[:created_at])
      end

      should 'have the deleted_at attribute' do
        assert_equal(@program.deleted_at, test_program[:deleted_at])
      end

      should 'have the name attribute' do
        assert_equal(@program.name, test_program[:name])
      end

      should 'have the geo_ids attribute' do
        assert_equal(@program.geos.json, test_program[:geo_ids])
        assert(@program.geos.is_a?(APIList))
      end

      # should 'have the packages attribute' do
      #   assert(@candidate.packages.any?)
      #   assert(@candidate.packages.is_a?(PackageList))
      # end

      should 'have the package_ids attribute' do
        assert_equal(@program.packages.json, test_program[:package_ids])
        assert(@program.packages.is_a?(APIList))
      end
    end

    context '#all' do
      should 'return instances of Program' do
        @mock.expects(:get).once.with(@program_url, anything, anything)
            .returns(test_response(test_program_list))
        assert_equal(Program.all.first.class, Program)
      end
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Program))
      assert_equal(Program, APIClass.subclass_fetch('program'))
    end

  end
end
