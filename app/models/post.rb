class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :title_is_clickbait

    def title_is_clickbait
        titles = [/Won't Believe/i,/Secret/i,/Top \d/i,/Guess/i] 
        if titles.none? {|phrase| phrase.match title } 
            errors.add(:title, "Not a valid title")
        end
    end
end
