class Task < ApplicationRecord
    validates :name, presence:true
    validates :details, presence:true
    enum priority: [:low, :medium, :high ]
    paginates_per 5
    validates :status, presence:true
    belongs_to :user

    has_many :tasks_labels
 has_many :labels, :through => :tasks_labels
 accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
    a['label_id'].blank? }
 accepts_nested_attributes_for :labels
end
