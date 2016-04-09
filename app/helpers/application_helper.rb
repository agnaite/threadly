module ApplicationHelper
  def auto_link_usernames(text)
  text.split.map do |word| # for each word in the text
    # check if the words starts with a '@' and that there is a user with
    # that username in the database (if so, assign it to user)
    if word =~ /^@/ and !(user = User.where(username: word.gsub('@', '')).first).nil?
      # make a link
      link_to word, { controller: "users", action: "show", id: user.id }
      #return user.id
    else
      # or just return the word if it's not a mention or the username doesn't exist
      word
    end
  end.join(' ').html_safe
end

def emojify(content)
  h(content).to_str.gsub(/:([\w+-]+):/) do |match|
    if emoji = Emoji.find_by_alias($1)
      %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
    else
      match
    end
  end.html_safe if content.present?
end


end
