class Blog < ApplicationRecord
  belongs_to :user
  attachment :image
  acts_as_taggable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum status: { draft: 0, published: 1, deleted: 2 }
  validates :status, inclusion: { in: Blog.statuses.keys }

  validates :title, presence: true
  validates :body, presence: true
  def status_text
    if blog.status == "draft"
      "非公開"
    else
      "公開"
    end
  end

  
end
