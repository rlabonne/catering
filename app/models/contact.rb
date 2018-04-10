class Contact < ApplicationRecord
  belongs_to :user

  def name
    "#{firstName} #{lastName}"
  end

end
