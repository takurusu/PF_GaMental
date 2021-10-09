class Game < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :image

  def self.looks(search, word)
    if search == "perfect_match"
      @game = Game.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @game = Game.where("title LIKE?", "#{word}%")
    elsif search == "backward_match"
      @game = Game.where("title LIKE?", "%#{word}")
    elsif search == "partial_match"
      @game = Game.where("title LIKE?", "%#{word}%")
    else
      @game = Game.all
    end
  end
end
