module Badges
  class FirstTimeTrySpecification < AbstractSpecification

    def success?
      @test_passage.user.test_passages.where(test: @test_passage.test).count == 1
    end
  end
end
