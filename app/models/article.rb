class Article < ActiveRecord::Base
  # with the has_many/belongs_to association, we can now ie pull up comments belonging to an article by @article.comments 
  # Now that we have comments, we want the comments to be deleted if an article is deleted, so we add a destroy dependency
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
