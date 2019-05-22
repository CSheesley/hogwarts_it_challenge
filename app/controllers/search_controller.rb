class SearchController < ApplicationController

  def index
    # binding.pry
    # "house"=>"Slytherin"
    render locals: {
      facade: HouseSearchFacade.new(params[:house])
    }
  end

end
