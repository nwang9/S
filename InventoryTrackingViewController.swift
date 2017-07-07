//
//  InventoryTrackingViewController.swift
//  Smarthin
//
//  Created by Nico on 6/22/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class InventoryTrackingViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    let idsToQuery: [String] = ["TehPVqdlTP", "ot9rpYmb9P"]
    var sweaters: [PFObject] = []
    var shirts: [PFObject] = []
    
   // Store Inventory Data in cellContent
    // let cellContent = [a:b]
    
    //Define rows etc.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Query for objects for that company
       let positionsTable = [[String : AnyObject]]()
        
        return positionsTable.count
        
    }
    
    // Create cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "trackingCell")
        cell.tag = indexPath.row
        
        //Replace line below with inventory item name
       // cell.textLabel?.text = "1" + String(self.sweaters[0]["Size"]) + String(self.sweaters[0]["Color"]) + "Shirt"
        
        cell.textLabel?.text = "Testing"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let idsToQuery: [String] = ["TehPVqdlTP", "ot9rpYmb9P"]
        var sweaters: [PFObject] = []
        var shirts: [PFObject] = []
        
        */
        
        // Retrieve shirts that were scanned
        let shirtQuery = PFQuery(className: "Shirt")
        
        for id in idsToQuery {
            shirtQuery.getObjectInBackground(withId: id) { (object, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    if let shirt = object {
                        self.shirts.append(shirt)
                        print(shirt["Color"])
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
                    self.sweaters.append(sweater)
                    }
                }
            }
        }
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // Send to scan page
     @IBAction func scanInventory(sender: UIButton) {
     let indexPath = sender.tag
     
     //-----TO DO------- Change indexPath!=nil to if let
     if indexPath >= 0 {
     
     let invScanViewController:ScanInventoryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inventoryScan") as! ScanInventoryViewController
     invScanViewController.clientID = indexPath
     self.present(invScanViewController, animated: false, completion: nil)
     }
     }
     // Send to trace page
     @IBAction func traceInventory(sender: UIButton) {
     let indexPath = sender.tag
     
     if indexPath >= 0 {
     let invTraceViewController:TraceInventoryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inventoryTrace") as! TraceInventoryViewController
     invTraceViewController.clientID = indexPath
     self.present(invTraceViewController, animated: false, completion: nil)
     }
     }
     */
}
