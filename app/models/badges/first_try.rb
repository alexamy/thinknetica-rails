class Badges::FirstTry < Badge
  alias_attribute :test, :condition

  def reward?(user, test)
    return unless test.id == test

    user.test_passages.where(test: test).count == 1
  end
end
