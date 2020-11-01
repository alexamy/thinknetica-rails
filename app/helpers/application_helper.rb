module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to repo.capitalize, "https://github.com/#{author}/#{repo}/"
  end

  def admin?
    current_user.admin? if current_user
  end

  def enum_for_select(model, key)
    model.send(key.to_s.pluralize)
      .map { |value, _| [model.human_enum_name(key, value), value] }
  end
end
