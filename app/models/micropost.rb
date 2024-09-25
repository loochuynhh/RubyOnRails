class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }

  validates :content, presence: true, length: {maximum: 140}
  validates :user_id, presence: true
  validates :image, content_type: {in: %w[image/jpeg image/gif image/png], message: 'must be a valid image format'},
                    size: {less_than: 5.megabytes, message: 'should be less than 5MB'}

  def display_image
    image.variant(resize_to_limit: [720, 720]).processed
  end
end
