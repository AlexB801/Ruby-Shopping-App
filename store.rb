class Store
  attr_accessor :name, :inventory, :user
  def initialize(name, user)
    @name = name
    @user = user
    @inventory = [
      { name: 'Movie', price: 50, qty: 5 },
      { name: 'CD', price: 15, qty: 2 },
      { name: 'Video Game', price: 60, qty: 4 }
    ]
  end

  def display_items
    @inventory.each_with_index do |item, index|
      name = item[:name]
      price = item[:price]
      qty = item[:qty]
      color = (price > @user.wallet_amt || qty == 0)
      puts "#{index + 1}: #{name}: $#{price} (#{qty})"
    end
  end

  def shop
    display_items
    puts "Select an item to buy."
    choice = gets.to_i
    if choice > 0 && choice <= @inventory.length
      item = @inventory[choice - 1]
      if item[:qty] == 0
        puts "Out of Stock."
      else
        purchased = @user.update_inventory(item)
        item[:qty] -= 1 if purchased
      end

      puts "Do you want to keep shopping? (y/n)"
      cont = gets.strip.downcase
      shop if cont == 'y' || cont == 'yes'
    else
      puts "Invalid choice, try again."
      shop
    end
  end
end
