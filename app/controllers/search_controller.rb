class SearchController < ApplicationController

  def index
    # binding.pry
    # "house"=>"Slytherin"
    render locals: {
      facade: SearchFacade(params[:house])
    }
  end

end
