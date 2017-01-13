class CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all
  	render 'index.html.erb'
  end

  def show
    @capstone = Capstone.find params[:id]
  end

  def test
    
  end
end
