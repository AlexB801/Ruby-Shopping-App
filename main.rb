require_relative 'user'
require_relative 'store'

class App
  attr_accessor :user

  def initialize
    puts "What is your name?"
    name = gets.strip
    puts "How much money do you have?"
    amt = gets.to_f
    @user = User.new(name, amt)
    @store = Store.new(@store, @user)
    puts "#{@user.name} has $#{@user.wallet_amt} to spend!"
  end

  def menu
    puts "Shopping App"
    puts "1. View store inventory."
    puts "2. Display current wallet amount."
    puts "3. View cart."
    puts "4. Exit."
    menu_option(gets.to_i)
  end

  def menu_option(choice)
    case choice
    when 1
      @store.shop
    when 2
      puts "You have $#{@user.wallet_amt} left to spend!\n"
    when 3
      @user.show_inventory
    when 4
      puts "Thank you for shopping!\n"
      exit
    else
      puts "Invalid choice, try again."
      menu
    end
      menu
  end
end

app = App.new
app.menu
