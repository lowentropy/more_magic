class String
  def legal_name
    (self =~ /^[0-9]/) ? "_#{self}" : self
  end
end