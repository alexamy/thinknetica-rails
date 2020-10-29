class Badges::Category < Badge
  alias_method :category, :condition

  def reward?(user, test)
    return unless test.category == category

    tests_all = Test.where(category: category).map(&:id).sort
    tests_user = user.test_passages.map(&:test)
      .select { |test| test.category == category }
      .map(&:id).uniq.sort

    tests_user == tests_all
  end
end
