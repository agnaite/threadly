module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, size = 200)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}?d=mm"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar", d: "mm")
  end
end
