class Task < ApplicationRecord
    validates :name, presence:true
    validates :details, presence:true
    enum priority: [:low, :medium, :high ]
    paginates_per 2
    validates :status, presence:true
end
