class AddBadgesService

  RULES = { by_category: Badges::ByCategorySpecification,
            by_level: Badges::ByLevelSpecification,
            first_time_try: Badges::FirstTimeTrySpecification }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def check
    Badge.find_each do |badge|
      checkup = RULES[badge.rule_type.to_sym].new(test_passage: @test_passage, option: badge.rule_option)
      add_badge(badge) if checkup.success?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges << badge
  end
end

