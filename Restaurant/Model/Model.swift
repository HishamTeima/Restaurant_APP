//
//  Model.swift
//  Restaurant
//
//  Created by Hany Karam on 1/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
class Model{
    var image:String = ""
    var name:String = " "
    var price:Int
    var id:Int
    var quantity:Int
    init(image:String,name:String,price:Int,id:Int,quantity:Int) {
        self.image = image
        self.name  = name
        self.price = price
        self.id = id
        self.quantity = quantity
    }
}
