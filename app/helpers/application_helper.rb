module ApplicationHelper
  def format_timesince(time)
    difference = (Time.zone.now- time)
    if difference<120
      return "about a minute ago"
    elsif difference<3600
      return (difference/60).to_i.to_s + " minutes ago"
    elsif difference<86400
      return (difference/3600).to_i.to_s + " hours ago"
    else
      return (difference/86400).to_i.to_s + " days ago"
    end
  end

end
