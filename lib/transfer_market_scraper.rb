require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'json'

class TransferMarketScraper
  def self.scrape(url)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'

    content = agent.get(url)

    {
      nickname: get_nickname(content),
      photo: get_photo(content),
      complete_name: get_complete_name(content),
      birth_date: get_birthdate(content),
      birthplace: get_birthplace(content),
      height: get_height(content),
      nationality: get_nationality(content),
      position: get_position(content),
      foot: get_foot(content),
      manager: get_manager(content),
      current_club: get_current_club(content),
      in_team_since: get_in_team_since(content),
      contract_until: get_contract_until(content),
      amount: get_amount(content)
    }
  end

  private

  def self.get_nickname(agent)
    agent.search(".dataName h1 b").text.to_s.strip
  end

  def self.get_photo(agent)
    agent.search(".dataBild img").first.values[0]
  end

  def self.get_amount(agent)
    agent.search(".dataMarktwert").text.to_s.strip
  end

  def self.get_complete_name(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Full name:"
    end
    result
  end

  def self.get_birthdate(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Date of birth:"
    end
    result
  end

  def self.get_birthplace(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      if tr.search("th").text.to_s == "Place of birth:"
        result = tr.search("td").text.to_s.strip
      end
    end
    result
  end

  def self.get_height(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Height:"
    end
    result
  end

  def self.get_nationality(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Citizenship:"
    end
    result
  end

  def self.get_position(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Position:"
    end
    result
  end

  def self.get_foot(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Foot:"
    end
    result
  end

  def self.get_manager(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Player agent:"
    end
    result
  end

  def self.get_current_club(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s.strip == "Current club:"
    end
    result
  end

  def self.get_in_team_since(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Joined:"
    end
    result
  end

  def self.get_contract_until(agent)
    result = 0
    agent.search(".spielerdaten .auflistung tr").each do |tr|
      result = tr.search("td").text.to_s.strip if tr.search("th").text.to_s == "Contract expires:"
    end
    result
  end


  def self.save(data)
    File.open('player.json', "w+") do |f|
      f << data.to_json
    end
  end
end

# p TransferMarketScraper.scrape("https://www.transfermarkt.com/cristiano-ronaldo/profil/spieler/8198")