class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  # GET /posts.json
def index
@posts = Post.all
end
# GET /posts/1


end
