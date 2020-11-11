class Opinion < ApplicationRecord
  validates :Text, presence: true

  belongs_to :user, foreign_key: 'AuthorId', class_name: 'User'
end
