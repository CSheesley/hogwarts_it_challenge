class HouseSearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def students
    students = house_data[:students]
    students.map do |student_data|
      Student.new(student_data)
    end
  end

  private

  def house_data
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    data.first[:attributes]
  end

  def conn
    Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?") do |f|
      f.params["api_key"] = ENV['HOGWARTS_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end


end
