class BadgeTestReward < ApplicationService
  def initialize(user, test_passage)
    @user = user
    @test = @test_passage.test
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      @user.badges << badge if badge.reward?(@user, @test)
    end
  end
end
