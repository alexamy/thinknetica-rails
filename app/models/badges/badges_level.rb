class Badges::Level < Badge
  alias_method :level, :condition

  def reward?(user, test)
    return unless test.level == level

    tests_all = Test.where(level: level).map(&:id).sort
    tests_user = user.test_passages.map(&:test)
      .select { |test| test.level == level }
      .map(&:id).uniq.sort

    tests_user == tests_all
  end
end
