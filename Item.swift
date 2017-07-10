//
//  Item.swift
//  Smarthin
//
//  Created by Nico on 7/10/17.
//  Copyright © 2017 Smarthin. All rights reserved.
//

import Foundation
import Parse

class Item: PFObject {
    var Size: String!
    var Color: String!
    var objectType: String!
    
    init(Size: String, Color: String, objectType: String) {
        self.Size = Size
        self.Color = Color
        self.objectType = objectType
        super.init()
    }
}
