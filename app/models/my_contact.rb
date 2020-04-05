class MyContact < ApplicationRecord
  belongs_to :group

  paginates_per 10

  validates :name, :email, :group_id, presence: true
  validates :name, length: {minimum: 3}

  #PaperClip configuiration
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

def gravatar
  hash = Digest::MD5.hexdigest(email)
   "https://www.gravatar.com/avatar/#{hash}"
end

#Search query for all contact

scope :search, -> (term) do
  where('LOWER(name) LIKE :term or LOWER(company) LIKE :term or LOWER(phone) LIKE :term or LOWER(email) LIKE :term or LOWER(address) LIKE :term',term: "%#{term.downcase}%") if term.present?
  end
#def self.search(term)
  #  if term && !term.empty?
    #  where('name LIKE ?', "%#{term}%")
    #  else
    #  all
  #  end
#  end

#Search from group contact

scope :by_group, -> (group_id){where(group_id: group_id) if group_id.present?}
#def self.by_group(group_id)
  #if group_id && !group_id.empty?
  #  where(group_id: group_id)
#  else
#    all
#  end
#end




end
