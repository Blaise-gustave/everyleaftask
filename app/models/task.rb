class Task < ApplicationRecord
    validates :name, presence:true
    validates :details, presence:true
    enum priority: [:low, :medium, :high ]
    paginates_per 5
    validates :status, presence:true
    belongs_to :user
end
