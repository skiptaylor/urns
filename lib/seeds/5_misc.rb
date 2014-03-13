Product.where('quantity < 1').update(status: 'Sold')
Product.where('quantity = 1').update(status: 'Complete')
Product.where('quantity > 1').update(status: 'Active')
Product.where('quantity = -1').update(status: 'Hold')
