require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'json'

class ClubTransferMarket
  def self.scrape(url)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'

    content = agent.get(url)

    {
      address: get_address(content),
      name: get_name(content),
      phone_number: get_phone_number(content),
      founded: get_founded(content),
      website: get_website(content),
      logo: get_logo(content)
    }
  end

  private

  def self.get_address(agent)
    result = 0
    agent.search(".content .profilheader tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Address:"
    end
    result
  end

  def self.get_name(agent)
    result = 0
    agent.search(".content .profilheader tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Official club name:"
    end
    result
  end

  def self.get_phone_number(agent)
    result = 0
    agent.search(".content .profilheader tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Tel:"
    end
    result
  end

  def self.get_founded(agent)
    result = 0
    agent.search(".content .profilheader tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Founded:"
    end
    result
  end

  def self.get_website(agent)
    result = 0
    agent.search(".content .profilheader tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Website:"
    end
    result
  end

  def self.get_logo(agent)
    agent.search(".dataBild img").first.values[0]
  end

  def self.save(data)
    File.open('player.json', "w+") do |f|
      f << data.to_json
    end
  end
end

# p TransferMarketScraper.scrape("https://www.transfermarkt.com/sporting-lissabon/startseite/verein/336")