class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fictio)}
  validate :check_clickbait

  def check_clickbait
    clickbait_phrases = [/Won't Believe/, /Secret/, /Top \d+/, /Guess/]
    if clickbait_phrases.none? {|regx| regx.match(title)}
      errors.add(:title, "is not sufficiently clickbait-y")
    end
  end
end
