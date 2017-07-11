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
    // All found objects in scan
    let idsToQueryForGroup: [String] = ["TehPVqdlTP", "ot9rpYmb9P", "Orn6jVn1PR", "sLEBMmFuv8"]
    var groupItems: [Item] = []
    
    init() {
        
    }

    func getItems() -> [Item] {
        return groupItems
    }

    
    func getDataFromServer(complete: @escaping ()->()) {
        // Retrieve shirts that were scanned
        
        for id in idsToQueryForGroup {
            let shirtQuery = PFQuery(className: "Shirt")
            
            shirtQuery.getObjectInBackground(withId: id)
            {
                (object, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    if let shirt = object {
                    let item = Item(Size: shirt["Size"] as! String, Color: shirt["Color"] as! String, objectType: "Shirt",Id: shirt.objectId as! String)
                        self.groupItems.append(item)
             
                    } else {
                        print("Nothing found")
                    }
                }
            }
        }
 
        
        // Retrieve sweaters that were scanned
      //  let sweaterQuery = PFQuery(className: "Sweater")
        
        for id in idsToQueryForGroup {
            let sweaterQuery = PFQuery(className: "Sweater")
            
            sweaterQuery.getObjectInBackground(withId: id) { (object, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    if let sweater = object {
                        let item = Item(Size: sweater["Size"] as! String, Color: sweater["Color"] as! String, objectType: "Sweater", Id: sweater.objectId as! String)
                        self.groupItems.append(item)
                    }
                }
                complete()
            }
            
        }
     
    }
    


}
