require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'json'
require 'byebug'

class TransferMarketScraper
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
      # nationality: get_nationality(content),
      # position: get_position(content),
      # foot: get_foot(content),
      # manager: get_manager(content),
      # current_club: get_current_club(content),
      # in_team_since: get_in_team_since(content),
      # contract_until: get_contract_until(content),
      # amount: get_amount(content)
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

  # def self.get_birthdate(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Date of birth:"
  #   end
  #   result
  # end

  # def self.get_birthplace(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     if tr.search("th").text.to_s == "Place of birth:"
  #       result = tr.search("td").text.to_s.strip
  #     end
  #   end
  #   result
  # end

  # def self.get_height(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Height:"
  #   end
  #   result
  # end

  # def self.get_nationality(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Citizenship:"
  #   end
  #   result
  # end

  # def self.get_position(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Position:"
  #   end
  #   result
  # end

  # def self.get_foot(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Foot:"
  #   end
  #   result
  # end

  # def self.get_manager(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Player agent:"
  #   end
  #   result
  # end

  # def self.get_current_club(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s.strip == "Current club:"
  #   end
  #   result
  # end

  # def self.get_in_team_since(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Joined:"
  #   end
  #   result
  # end

  # def self.get_contract_until(agent)
  #   result = 0
  #   agent.search(".spielerdaten .auflistung tr").each do |tr|
  #     result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Contract expires:"
  #   end
  #   result
  # end


  def self.save(data)
    File.open('player.json', "w+") do |f|
      f << data.to_json
    end
  end
end

p TransferMarketScraper.scrape("https://www.transfermarkt.com/sporting-lissabon/startseite/verein/336")