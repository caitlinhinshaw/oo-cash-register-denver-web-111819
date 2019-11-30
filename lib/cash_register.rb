require 'pry'

class CashRegister
    attr_accessor :total, :discount, :item_list, :last_transaction

    def initialize(discount = nil)
        @total = 0.0
        @discount = discount
        @item_list = []
    end

    def add_item(title, price, quantity = 1)
        @last_transaction = price*quantity
        #binding.pry
        quantity.times {item_list << title}
        self.total += price*quantity
    end

    def discount_amount
        self.total*discount/100
    end

    def apply_discount
        if discount
            self.total -= self.discount_amount
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        item_list
    end

    def void_last_transaction
        self.total -= last_transaction
        #binding.pry
    end

    #binding.pry
end
