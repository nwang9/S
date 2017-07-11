//
//  InventoryTrackingViewController.swift
//  Smarthin
//
//  Created by Nico on 6/22/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
//import Parse

class InventoryTrackingViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
   

    var groupItems: [Item] = []
    let manager = ItemDataSource()
    let foundIds: [String] = ["ot9rpYmb9P"]
    
    //Define rows etc.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.groupItems.count
        
    }
    
    // Create cell
    public func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "trackingCell")
        //cell.tag = indexPath.row
        let item = self.groupItems[indexPath.row]
        cell.textLabel?.text = "1 " + item.Size + " " + item.Color + " " + item.objectType
        for groupItem in foundIds {
            if item.Id == groupItem {
                cell.backgroundColor = UIColor.green
                break
            } else {
                cell.backgroundColor = UIColor.red
            }
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        manager.getDataFromServer(complete: { () -> () in
            self.reloadTableData()
        })
    }
    
    
    // Reload Table after data retrieval
    func reloadTableData () {
        self.groupItems = manager.getItems()
        self.tableView.reloadData()
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
