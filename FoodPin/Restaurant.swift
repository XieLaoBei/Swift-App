//
//  Restaurant.swift
//  FoodPin
//
//  Created by LaoBei Xie on 18/01/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var image: String = ""
    var isVisited: Bool = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
