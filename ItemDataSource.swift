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
        getDataFromServer()
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
                    let item = Item(Size: shirt["Size"] as! String, Color: shirt["Color"] as! String, objectType: "Shirt")
                        self.items.append(item)
                    }
                }
            }
        }
 
        
        // Retrieve sweaters that were scanned
      //  let sweaterQuery = PFQuery(className: "Sweater")
        
        for id in idsToQuery {
            let sweaterQuery = PFQuery(className: "Sweater")
            sweaterQuery.getObjectInBackground(withId: id) { (object, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    if let sweater = object {
                        let item = Item(Size: sweater["Size"] as! String, Color: sweater["Color"] as! String, objectType: "Sweater")
                        self.items.append(item)
                    }
                }
            }
        }
    }
}
