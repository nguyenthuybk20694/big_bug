class Category < ActiveRecord::Base
    validates :name,  presence: true, length: { minimum: 1 }
    validates :description,  presence: true, length: { minimum: 1 }
    has_many :reviews,dependent: :destroy
    belongs_to :user
end
