class CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all
  end

  def show
    @capstone = Capstone.find_by id: params[:id]
  end
end
