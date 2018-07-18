class InternetProtocol < ApplicationRecord
  belongs_to :user

  validates :address, presence: true, uniqueness: { case_sensitive: false }
end
