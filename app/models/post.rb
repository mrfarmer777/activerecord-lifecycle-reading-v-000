class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  #callback, before you even TRY to save anything, before you validate it
  before_validation :make_title_case

  #do this after it's validated, but before it's saved.
  #before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
