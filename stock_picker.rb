# A simple program which takes in a an array of stock prices per day and returns the best day to buy and sell to maximize profit

def stock_picker(prices)
  buy_day = 0
  sell_day = 1
  prices.each_with_index do |stock, index|
    if stock < prices[buy_day] # Changes buy date to current iteration day if current price is lower than lowest price
      # Only changes the dates if there is a future price with a greater difference than current difference (protects against very low late prices)
      if ((prices[index..].max - prices[index]) > (prices[sell_day] - prices[buy_day])) 
        buy_day = index
        sell_day = prices[index..].index(prices[index..].max) # Changes sell date as well to allow for proper profit difference calculation in next step
      end
    elsif (stock - prices[buy_day]) > (prices[sell_day] - prices[buy_day]) # Changes sell date if profit difference exceeds current difference
      sell_day = index if index != 0 # Sell date cannot be first day
    end
  end
  [buy_day, sell_day]
end

p "The best days to buy and sell the stock respectively are: #{stock_picker([25,10,-3,6,9,15,8,6,10,0,12,19,20,1,5,10,19,25,-2,2,4,5,24])}"