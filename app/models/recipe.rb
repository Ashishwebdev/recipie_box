class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
  validates :title, :description, :image, presence: true
  has_attached_file :image, styles: { medium: "400x400#>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
