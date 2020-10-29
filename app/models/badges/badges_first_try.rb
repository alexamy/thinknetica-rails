class Badges::FirstTry < Badge
  alias_method :test_id, :condition

  def reward?(user, test)
    return unless test.id == test_id

    user.test_passages.where(test: test_id).count == 1
  end
end
