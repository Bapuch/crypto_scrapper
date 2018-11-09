require 'nokogiri'
require 'open-uri'

class StartScrap

  def initialize
    @url = "https://coinmarketcap.com/all/views/all/"
    @cryptos = {}
  end

  def get_cryptos
    webpage = Nokogiri::HTML(open(@url))
    webpage.css('tbody>tr').each do |row|
      @cryptos[row.css('.currency-name')[0]['data-sort']] = row.css('.text-right')[1]['data-sort']
    end
  end

  def save
    @cryptos.each { |name, price| Crypto.create!(name: name, value: price) }
  end

  def perform
    Crypto.destroy_all unless Crypto.count.zero?
    get_cryptos
    save
  end
end
