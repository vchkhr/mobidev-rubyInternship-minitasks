inventory = [
    {price: 125.00, name: "Cola", quantity_by_size: {l033: 3, l05: 7, l1: 8, l2: 4}},
    {price: 40.00, name: "Pepsi", quantity_by_size: {}},
    {price: 39.99, name: "Water", quantity_by_size: {l033: 1, l2: 4}},
    {price: 70.00, name: "Juice", quantity_by_size: {l033: 7, l05: 2}}
]

class ShopInventory
    def initialize(inventory)
        @inventory = inventory
    end

    def item_in_stock
        res = []

        @inventory.each do |inventory|
            if inventory[:quantity_by_size].length > 0
                res.push(inventory[:name])
            end
        end

        return res.sort
    end

    def out_of_stock
        res = []

        @inventory.each do |inventory|
            if inventory[:quantity_by_size].length == 0
                res.push(inventory)
            end
        end

        return res
    end

    def affordable
        res = []

        @inventory.each do |inventory|
            if inventory[:price] < 50
                res.push(inventory)
            end
        end

        return res
    end

    def how_much_left(name)
        @inventory.each do |inventory|
            if inventory[:name] == name
                return inventory[:quantity_by_size]
            end
        end
    end

    def total_stock
        total = 0

        @inventory.each do |inventory|
            inventory[:quantity_by_size].each do |key, val|
                total += val
            end
        end

        return total
    end
end

puts "Challenge 1: ", ShopInventory.new(inventory).item_in_stock, "\n"
# => [“Cola”, “Juice”, “Water”]

puts "Challenge 2: ", ShopInventory.new(inventory).affordable, "\n"
# => [
#       {price: 40.00, name: "Pepsi", quantity_by_size: {}},
#       {price: 39.99, name: "Water", quantity_by_size: {l033: 1, l2: 4}}
#    ]

puts "Challenge 3: ", ShopInventory.new(inventory).out_of_stock, "\n"
# => [{price: 40.00, name: "Pepsi", quantity_by_size: {}}]

puts "Challenge 4: ", ShopInventory.new(inventory).how_much_left("Cola"), "\n"
# => {l033: 3, l05: 7, l1: 8, l2: 4}

puts "Challenge 5: ", ShopInventory.new(inventory).total_stock
# => 36
