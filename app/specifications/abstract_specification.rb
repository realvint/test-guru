class AbstractSpecification

  def initialize(test_passage:, option:)
    @test_passage = test_passage
    @option = option
  end

  def success?
    raise "#{__method__} undefined for #{self.class}"
  end
end
