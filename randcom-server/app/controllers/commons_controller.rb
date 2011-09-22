class CommonsController < ApplicationController
  respond_to :json

  def random
    respond_with(Commons.new.random_photo params)
  end

  def institutions
    respond_with(Commons.new.institutions params)
  end
end
