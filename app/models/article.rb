class Article < ActiveRecord::Base
	#active dir maps column names to attributes
	#so no need to declare variables text & title here ...
	
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: {minimum: 5, maximum: 20}
	validates :text,  presence: true, length: {minimum: 5}


end
