class Stock < ApplicationRecord
	has_many :user_stocks
	has_many :users, through: :user_stocks

	def self.find_by_symbol(symbol)
		where(symbol: symbol).first
	end

	def price
		opening_price = StockQuote::Stock.quote(symbol).open
		return "#{opening_price} (opening)" if opening_price

		closing_price = StockQuote::Stock.quote(symbol).previous_close
		return "#{closing_price} (closing)" if closing_price

		"Unavailable"
	end

	def self.new_from_lookup(symbol)
		lookup_symbol = StockQuote::Stock.quote symbol
		return nil unless lookup_symbol.name

		new_stock = new(symbol: lookup_symbol.symbol, name: lookup_symbol.name)
		new_stock.last_price = new_stock.price
		new_stock
	end
end