module ApplicationHelper

  def full_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type)
    unless flash[type].blank?
      content_tag :p, flash[type], class: "flash #{type}"
    end
  end
end
