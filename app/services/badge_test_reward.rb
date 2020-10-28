class BadgeTestReward < ApplicationService
  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
    @test = @test_passage.test
    @badges = Badge.all
  end

  def call
    return unless @test_passage.completed?

    @badges.each do |badge|
      can_reward = find_test_first_try(badge) || find_category(badge) || find_level(badge)
      @user.badges << badge if can_reward
    end
  end

  private

  def find_test_first_try(badge)
    return unless badge.test_first_try == @test

    @user.test_passages.where(test: badge.test_first_try).count == 1
  end

  def find_category(badge)
    return unless badge.category == @test.category

    tests_user = @user.test_passages.map { |passage| passage.test.id }.uniq.sort
    tests_all = Test.where(category: badge.category).map(&:id).sort

    tests_user == tests_all
  end

  def find_level(badge)
    return unless badge.level == @test.level

    tests_user = @user.test_passages.map { |passage| passage.test.id }.uniq.sort
    tests_all = Test.where(level: badge.level).map(&:id).sort

    tests_user == tests_all
  end
end
