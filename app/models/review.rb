class Review < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	include Bootsy::Container
	
    validates :title,  presence: true, length: { minimum: 1 }
	validates :image,  presence: true, length: { minimum: 1 }
	validates :content,  presence: true, length: { minimum: 1 }
	mount_uploader :image, ReviewImageUploader
	
	def self.search(search)
	  # Title is for the above case, the OP incorrectly had 'name'
	  where("title LIKE ?", "%#{search}%")
	end
end
