class HogwartsService

  def initialize(house)
    @house = house
  end

  def house_number(house)
    houses = {
    "Griffyndor" => 1,
    "Ravenclaw" => 2,
    "Hufflepuff" => 3,
    "Slytherin" => 4
    }
    houses[house]
  end

  def conn
    Faraday.new("http://hogwarts-as-a-service.herokuapp.com/api/v1/house/#{house_number(@house)}?") do |f|
      f.headers["x_api_key"] = ENV['HOGWARTS_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end
