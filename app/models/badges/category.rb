class Badges::Category < Badge
  alias_attribute :category, :condition

  def reward?(user, test)
    return unless test.category.id == category

    tests_all = Test.where(category: category).ids.sort
    tests_user = user.test_passages.includes(:test)
      .where(tests: { category: category })
      .ids.uniq.sort

    tests_user == tests_all
  end
end
