class Contact < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy

  validates :address, presence: true

  accepts_nested_attributes_for :address, update_only: true

  def attributes
    # Return the shape of the object
    # You can use symbols if you like instead of string keys
    {
      'uhul' => 1,    
    }
  end
end
