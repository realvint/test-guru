module Badges
  class ByCategorySpecification < AbstractSpecification

    def success?

      return false if @option != @test_passage.test.category.title

      tests = Category.find_by(title: @option).tests.ids
      completed = @test_passage
                  .user
                  .test_passages
                  .where(successful: true, test_id: tests)
                  .pluck(:test_id)
                  .uniq
      tests.count == completed.count
    end
  end
end
