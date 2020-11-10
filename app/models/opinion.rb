class Opinion < ApplicationRecord
    belongs_to :user, foreign_key: 'AuthorId', class_name: 'User'
end
