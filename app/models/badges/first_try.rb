class Badges::FirstTry < Badge
  alias_attribute :test_id, :condition

  def test
    Test.find(test_id)
  end

  def reward?(user, test_completed)
    return unless test_completed == test

    user.test_passages.where(test: test).count == 1
  end
end
