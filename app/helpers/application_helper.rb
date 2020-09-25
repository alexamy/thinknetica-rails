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
end
