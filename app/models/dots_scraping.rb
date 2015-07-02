class DotsScraping < Feed
  def self.get_dots_event link
    agent = Mechanize.new
    begin
      page = agent.get(link)

      title = page.at('#text_event_title').inner_text
      place = page.at('#eventPlace .infoValue').inner_text
      address = page.at('#eventAddress .infoValue').inner_text
      started_at_str = page.at('#tile_date').inner_text
      started_at_ele = started_at_str.split("/")
      started_at = Time.new(started_at_ele[0], started_at_ele[1], started_at_ele[2].slice(0, 2))

      dots_event = DotsScraping.where(link: link).first_or_initialize
      dots_event.title = title
      dots_event.place = place
      dots_event.address = address
      dots_event.started_at = started_at
      dots_event.save
    rescue
      false
    end
  end
end
