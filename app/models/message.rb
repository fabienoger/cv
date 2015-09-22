class Message < ActiveRecord::Base
  validates :nom, presence: true
  validates :email, presence: true
  validates :content, presence: true
  validates_format_of :email, with: /\A.+@.+\Z/
end
