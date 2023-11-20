# Represents the association between an article and a tag.
class ArticleTag < ApplicationRecord
  belongs_to :article
  belongs_to :tag
end
