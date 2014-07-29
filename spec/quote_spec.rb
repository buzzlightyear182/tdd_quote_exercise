require 'spec_helper'

describe "Quote" do
	it "from point should always has two coordinates" do
		quote = Quote.new("motorbike")
    quote.from = [1,1]
		expect(quote.from.length).to eq(2)
	end

	it "each coordinate should be an integer" do
		quote = Quote.new("motorbike")
    quote.from = [1,1]
		expect(quote.from[0]).to be_a_kind_of(Numeric)
		expect(quote.from[1]).to be_a_kind_of(Numeric)
	end

  	it "to point should always has two coordinates" do
  		quote = Quote.new("motorbike")
      quote.to = [1,1]
      expect(quote.to.length).to eq(2)
  	end

  	it "each coordinate should be an integer" do
  		quote = Quote.new("motorbike")
      quote.to = [1,1]
  		expect(quote.to[0]).to be_a_kind_of(Numeric)
  		expect(quote.to[1]).to be_a_kind_of(Numeric)
  	end

  	it "if two points are the same, price should be zero" do
  		quote = Quote.new("motorbike")
  		quote.from = [1,1]
  		quote.to = [1,1]
  		expect(quote.price).to eq(0)
  	end
  	
  	it "if two points are not the same, price should be equal" do
  		quote = Quote.new("bike")
  		quote.from = [0,0]
  		quote.to = [3,4]
  		expect(quote.price).to eq(5)
  	end

    it "if the vehicle is a motorbike increase the price in 20%" do
      quote = Quote.new ("motorbike")
      quote.from = [0,0]
      quote.to = [3,4]
      expect(quote.price).to eq(6)
    end

    it "if the vehicle is a car increase the price in 30%" do
      quote = Quote.new ("car")
      quote.from = [0,0]
      quote.to = [3,4]
      expect(quote.price).to eq(6.5)
    end

    it "if the max distance is reached, greater_max_distance? return true" do
      quote = Quote.new ("bike")
      quote.from = [0,0]
      quote.to = [12,24]
      expect(quote.greater_max_distance?).to eq(true)
    end

    it "if the max distance is reached, greater_max_distance? return false" do
      quote = Quote.new("bike")
      quote.from = [0,0]
      quote.to = [3,4]
      expect(quote.greater_max_distance?).to eq(false)
    end

    it "cheaper_transport return the cheapest solution" do
      quote = Quote.new ("bike")
      quote.from = [0,0]
      quote.to = [12,24]
      expect(quote.cheaper_transport).to eq('motorbike')
    end

    it "should return price of cheapest solution" do
      quote = Quote.new ("bike")
      quote.from = [0,0]
      quote.to = [12,24]
      expect(quote.price).to eq(32.20)
    end

    it "should return price of user preference" do
      quote = Quote.new ("van")
      quote.from = [0,0]
      quote.to = [12,24]
      expect(quote.price).to eq(37.57)
    end
end