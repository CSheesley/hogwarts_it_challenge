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
    data = get_json
    data.first[:attributes]
  end

  def get_json
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def conn
    @_conn = service.conn
  end

  def service
    @_service = HogwartsService.new(@house)
  end

end
