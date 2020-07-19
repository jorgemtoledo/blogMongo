class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  # declare that we want to track comments
  include Mongoid::History::Trackable


  field :title, type: String
  field :body, type: String
  belongs_to :post, :inverse_of => :comments

  validates :title, presence: true

  # track title and body for all comments, scope it to post (the parent)
  # also track creation and destruction
  track_history     :on => [:title, :body], :scope => :post, :track_create => true, :track_destroy => true

end
