class Contact < ActiveRecord::Base
  has_many :comments
  belongs_to :contact
end
