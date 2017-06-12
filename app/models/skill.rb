class Skill < ApplicationRecord
  validates :user_id, :presence => true
  validates :title, :presence => true, :uniqueness => { :scope => :user_id , message: "You already have this skill listed!"}

  belongs_to :subcategory
  belongs_to :user

# <<<<<<< HEAD
#   include PgSearch
#   # multisearchable :against => [:description]
#   pg_search_scope :search, against: [:description]

#   # def self.search(search)
#   #   where("LOWER(description) LIKE ? OR LOWER(title) LIKE ?","%#{search.downcase}%", "%#{search.downcase}%")
#   # end
  
#   def self.description_search(query)
#     if query.present?
#       search(query)
#     else
#       scope
#     end
# =======
  def self.search(search, subcategory)
    where("subcategory_id = ? AND (LOWER(description) LIKE ? OR LOWER(title) LIKE ?)", subcategory.to_i, "%#{search.downcase}%", "%#{search.downcase}%")
# >>>>>>> master
  end

end
