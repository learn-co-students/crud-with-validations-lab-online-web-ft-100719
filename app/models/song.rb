class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Time.now.year, only_integer: true }
    validates :genre, presence: true
end
