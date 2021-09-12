class AddBadgesService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def add_badge

    if @test_passage.success?
      @test_passage.user.badges << Badge.first
      puts 'Badge added'
    else
      puts 'Badge NOT added'
    end
  end
end
