class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.human_name
    model_name.human
  end
end
