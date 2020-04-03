class ParksController < ApplicationController

  def show
    @park = Park.find(params[:park_id])
    binding.pry
  end

end
