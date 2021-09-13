module Badges
  class ByLevelSpecification < AbstractSpecification

    def success?
      level = @option.to_i

      return false if level != @test_passage.test.level

      tests = Test.where(level: level).pluck(:id)
      completed = @test_passage
                  .user
                  .test_passages
                  .where(successful: true, test: tests)
                  .pluck(:test_id)
                  .uniq
      tests.count == completed.count
    end
  end
end
