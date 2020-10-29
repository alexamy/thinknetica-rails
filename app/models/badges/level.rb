class Badges::Level < Badge
  def level
    condition.to_i
  end

  def reward?(user, test)
    return unless test.level == level

    tests_all = Test.where(level: level).ids.sort
    tests_user = user.test_passages.includes(:test)
      .where(tests: { level: level })
      .ids.uniq.sort

    tests_user == tests_all
  end
end
