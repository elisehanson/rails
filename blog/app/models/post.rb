class Post < ActiveRecord::Base
	
	belongs_to :user
	has_many :comments
	
	# attr_accessible :content, :name, :title

	#   validates :name,  :presence => true
 #  validates :title, :presence => true,
 #                    :length => { :minimum => 5 }
end
