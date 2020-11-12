class Opinion < ApplicationRecord
  validates :Text, presence: true
  validates :Text, length: { in: (1..300) }

  belongs_to :user, foreign_key: 'AuthorId', class_name: 'User'
end
