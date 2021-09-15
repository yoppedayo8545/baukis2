class Administrator < ApplicationRecord
  include EmailHolder
  include PasswordHolder
  
  def active?
    !suspended?
  end
end
