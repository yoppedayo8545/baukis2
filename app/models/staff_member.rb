class StaffMember < ApplicationRecord
  def password=(raw_password)
    if raw_password.kind_of?(string)
      self.hashed_password = Bcrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end
end