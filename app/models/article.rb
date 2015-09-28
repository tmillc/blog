class Article < ActiveRecord::Base
  # with the has_many/belongs_to association, we can now ie pull up comments belonging to an article by @article.comments 
  has_many :comments
  validates :title, presence: true, length: { minimum: 5 }
end
