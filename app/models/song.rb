class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}
    validates :released, inclusion: {in: [true, false]}
    with_options if: :released? do |r|
        r.validates :release_year, presence: true
        r.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
    end
    validates :artist_name, presence: true


end
