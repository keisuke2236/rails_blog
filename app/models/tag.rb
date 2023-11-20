# This is the Tag model class
class Tag < ApplicationRecord
  has_many :article_tags
  has_many :articles, through: :article_tags
end
