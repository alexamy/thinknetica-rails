class BadgeTestReward < ApplicationService
  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
    @test = @test_passage.test
    @badges = Badge.all
  end

  def call
    return unless @test_passage.completed? && @test_passage.successful?

    @badges.each do |badge|
      checks = [find_test_first_try(badge), find_category(badge), find_level(badge)]
      can_reward = checks.compact.all?(&:itself)

      @user.badges << badge if can_reward
    end
  end

  private

  def find_test_first_try(badge)
    return unless badge.test_first_try
    return false unless badge.test_first_try == @test

    @user.test_passages.where(test: badge.test_first_try).count == 1
  end

  def find_category(badge)
    return unless badge.category
    return false unless badge.category == @test.category

    tests_all = Test.where(category: badge.category).map(&:id).sort
    tests_user = @user.test_passages.map(&:test)
      .select { |test| test.category == badge.category }
      .map(&:id).uniq.sort

    tests_user == tests_all
  end

  def find_level(badge)
    return unless badge.level.positive?
    return false unless badge.level == @test.level

    tests_all = Test.where(level: badge.level).map(&:id).sort
    tests_user = @user.test_passages.map(&:test)
      .select { |test| test.level == badge.level }
      .map(&:id).uniq.sort

    tests_user == tests_all
  end
end
