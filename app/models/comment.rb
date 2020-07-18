class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  belongs_to :post

  validates :title, presence: true
end
