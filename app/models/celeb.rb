class Celeb < ApplicationRecord
has_one_attached :photo

validates :name, presence: true
validates :date, presence: true

    include PgSearch::Model
  pg_search_scope :search_by_name_and_date,
    against: [ :name, :date ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
