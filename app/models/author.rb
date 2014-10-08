class Author < ActiveRecord::Base
  has_many :articles
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "Should Match Confirmation", if: :password
end
