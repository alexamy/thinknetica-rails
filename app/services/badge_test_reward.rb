class BadgeTestReward < ApplicationService
  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
    @test = @test_passage.test
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      @user.badges << badge if send("#{badge.rule}_reward?", badge.condition)
    end
  end

  private

  def first_try_reward?(test)
    return unless @test.id == test

    user.test_passages.where(test: test).count == 1
  end


  def category_reward?(category)
    return unless @test.category.id == category

    tests_all = Test.where(category: category).ids.sort
    tests_user = @user.test_passages.includes(:test)
      .where(tests: { category: category })
      .ids.uniq.sort

    tests_user == tests_all
  end

  def level_reward?(level)
    return unless @test.level == level.to_i

    tests_all = Test.where(level: level).ids.sort
    tests_user = @user.test_passages.includes(:test)
      .where(tests: { level: level })
      .ids.uniq.sort

    tests_user == tests_all
  end
end
