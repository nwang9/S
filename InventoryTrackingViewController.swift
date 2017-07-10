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
    
    @IBOutlet weak var tableView: UITableView!
    let manager = ItemDataSource()

    var items: [Item] = []

    //Define rows etc.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
        
    }
    
    // Create cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "trackingCell")
        //cell.tag = indexPath.row
        let item = self.items[indexPath.row]
        cell.textLabel?.text = "1" + item.Size + item.Color + item.objectType
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.items = manager.getItems()

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
