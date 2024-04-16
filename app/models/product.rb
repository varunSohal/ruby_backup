class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :desc, presence: true
  validates :category_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "desc", "category_id", "price", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  def self.search(keyword, category_id = nil)
    if category_id.present?
      where(category_id: category_id).where("name LIKE ? OR desc LIKE ?", "%#{keyword}%", "%#{keyword}%")
    else
      where("name LIKE ? OR desc LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
  end
end
