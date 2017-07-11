//
//  Item.swift
//  Smarthin
//
//  Created by Nico on 7/10/17.
//  Copyright © 2017 Smarthin. All rights reserved.
//

import Foundation
import Parse

class Item: PFObject, PFSubclassing {

    static func parseClassName() -> String {
        return "Item"
    }
    
    var Size: String!
    var Color: String!
    var Id: String!
    var objectType: String!
    
    init(Size: String, Color: String, objectType: String, Id: String) {
        self.Size = Size
        self.Color = Color
        self.objectType = objectType
        self.Id = Id
        super.init()
    }
}
