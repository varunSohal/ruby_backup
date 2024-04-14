class Product < ApplicationRecord
  belongs_to :category

  def self.search(keyword, category_id = nil)
    if category_id.present?
      where(category_id: category_id).where("name LIKE ? OR desc LIKE ?", "%#{keyword}%", "%#{keyword}%")
    else
      where("name LIKE ? OR desc LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
  end
end
