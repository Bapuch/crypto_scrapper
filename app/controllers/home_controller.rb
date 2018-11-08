class HomeController < ApplicationController
  
  def index
  	@crypto = Crypto.new
  	StartScrap.new.perform

  end
  def show
  	@crypto_id = Crypto.find(params[:crypto][:id].to_f)
  end

end
