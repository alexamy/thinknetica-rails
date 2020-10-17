class Feedback < ApplicationRecord
  validates :email, format: { with: /.+@.+\..+/ }
end
