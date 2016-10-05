class Story
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :positive, type: Integer
  field :negative, type: Integer
end
