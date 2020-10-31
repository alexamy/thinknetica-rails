class Badge < ApplicationRecord
  has_many :badge_rewards
  has_many :users, through: :badge_rewards

  validates_presence_of :name, :filename, :rule, :condition

  def self.filenames
    %w[001-medal   002-trophy     003-flag   004-badge    005-medal
       006-medal   007-star       008-medal  009-trophy   010-flag
       011-trophy  012-medal      013-trophy 014-medal    015-trophy
       016-trophy  017-trophy     018-badge  019-medal    020-badge
       021-badge   022-trophy     023-trophy 024-gift     025-badge
       026-medal   027-badge      028-badge  029-trophy   030-medal
       031-badge   032-medal      033-trophy 034-football 035-diploma
       036-trophy  037-medal      038-trophy 039-trophy   040-trophy
       041-gift    042-trophy     043-badge  044-medal    045-badge
       046-diploma 047-basketball 048-badge  049-medal    050-trophy]
  end

  def self.rules
    %w[level category first_try]
  end

  def count_for(user)
    user.badges.count { |badge| badge == self }
  end
end
