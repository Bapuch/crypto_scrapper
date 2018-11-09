class HomeController < ApplicationController

  def index
  	@cryptos = Crypto.new
    StartScrap.new.perform
  end

  def price
    @cryptos = Crypto.new
    @crypto = Crypto.find(params[:crypto][:id].to_f)
    render 'index'
  end
end
