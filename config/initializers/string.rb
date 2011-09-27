class String
  def truncate_words(length = 30, truncate_string = "...")
    chars = self.split(//)
    if chars.length > length
      chars[0..(length-3)].join + truncate_string
    else
      self
    end
  end
end