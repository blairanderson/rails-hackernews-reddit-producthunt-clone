class Item < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments, class_name: "ItemComment"

  validates_presence_of :title, allow_blank: false

  validate do
    if content.blank? && url.blank?
      errors.add(:url, 'Submit a URL or Content')
    end
    if content.present? && url.present?
      errors.add(:url, 'Submit a URL or Content but not Both.')
    end
  end
  validates :url, url: {allow_nil: true, allow_blank: true}
end
