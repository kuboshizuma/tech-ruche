class ConnpassApi < Feed
  def self.save_connpass_event connpass_api_event

    begin
      connpass_event = ConnpassApi.where(link: connpass_api_event["event_url"]).first_or_initialize
      connpass_event.title = connpass_api_event["title"]
      connpass_event.place = connpass_api_event["place"]
      connpass_event.address = connpass_api_event["address"]
      connpass_event.started_at = connpass_api_event["started_at"]
      connpass_event.save
    rescue
      false
    end
  end
end
