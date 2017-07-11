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
   

    var items: [Item] = []
    let manager = ItemDataSource()
    
    //Define rows etc.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
        
    }
    
    // Create cell
    public func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
        manager.getDataFromServer(complete: { () -> () in
            self.reloadData()
        })
    }
    
    
    // Reload Table after data retrieval
    func reloadData () {
        self.items = manager.getItems()
        self.tableView.reloadData()
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
