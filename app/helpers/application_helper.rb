module ApplicationHelper
  def emphasize_letters(text, letters)
    letters = letters.split ''
    text = text.split ''
    str = ""
    until text.empty?
      letter = text.shift
      if letter.upcase == letters[0].upcase
        str << "<b>#{letter}</b>"
        letters.shift
      else
        str << letter
      end
      break if letters.empty?
    end
    str.html_safe + text.join('')
  end
end
