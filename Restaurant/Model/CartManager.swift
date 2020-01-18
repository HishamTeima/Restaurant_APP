//
//  CartManager.swift
//  Restaurant
//
//  Created by Hany Karam on 1/17/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
class CartManager {
    var items = [Model]()
    
    static let shared = CartManager()
    
    
    func addItem(_ item: Model) {
        
        
        if let index = items.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.id == item.id
        }) {
            items[index].quantity = items[index].quantity + 1
        } else {
            var newItem = item
            newItem.quantity = 1
            items.append(newItem)
        }
    }
    
    func removeItem(_ item: Model) {
        
        if let index = items.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.id == item.id
        }) {
            if items[index].quantity > 1 {
                items[index].quantity = items[index].quantity - 1
            } else {
                items.remove(at: index)
            }
        }
    }
    
    var totalItems: Int {
        return items.count
    }
    
    var cartTotal: Int {
        var total: Int = 0
        items.forEach{ total += $0.price * $0.quantity }
        return total
    }
    
}
