module ArticlesHelper
  def formated_id id
    "#{id}."
  end

  def formated_article article
    "#{formated_id(article.id)} #{article.created_at} #{article.description}"
  end
end
