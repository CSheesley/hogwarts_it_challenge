class HogwartsService

  def initialize(house)
    @house = house
  end


  def conn
    Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?") do |f|
      f.params["api_key"] = ENV['HOGWARTS_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end


end
