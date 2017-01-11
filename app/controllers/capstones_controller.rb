class CapstonesController < ApplicationController
  def index
    # @capstones = Capstone.all
  end

  def show
    @capstone = Capstone.find params[:id]
  end
end
