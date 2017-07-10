//
//  ItemDataSource.swift
//  Smarthin
//
//  Created by Nico on 7/10/17.
//  Copyright © 2017 Smarthin. All rights reserved.
//

import Foundation
import Parse

class ItemDataSource{
    let idsToQuery: [String] = ["TehPVqdlTP", "ot9rpYmb9P"]
    var items: [Item]
    var sweaters: [Item] = []
    var shirts: [Item] = []

    
    init() {
        items = []
        for sweater in sweaters {
            items.append(Item(Size: sweater.Size, Color: sweater.Color, objectType: "Sweater"))
        }
        for shirt in shirts {
            items.append(Item(Size: shirt.Size, Color: shirt.Color, objectType: "Shirt"))
        }
        
    }
    
    func getItems() -> [Item] {
        return items
    }
    
    func getDataFromServer() {
        // Retrieve shirts that were scanned
        let shirtQuery = PFQuery(className: "Shirt")
        
        for id in idsToQuery {
            shirtQuery.getObjectInBackground(withId: id) { (object, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    if let shirt = object {
                        self.shirts.append(shirt as! Item)
                    }
                }
            }
        }

        
        // Retrieve sweaters that were scanned
        let sweaterQuery = PFQuery(className: "Sweater")
        
        for id in idsToQuery {
            sweaterQuery.getObjectInBackground(withId: id) { (object, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    if let sweater = object {
                        self.sweaters.append(sweater as! Item)
                    }
                }
            }
        }
    }
}
