//
//  GroupViewController.swift
//  Smarthin
//
//  Created by Nico on 7/17/17.
//  Copyright © 2017 Smarthin. All rights reserved.
//

import UIKit

class GroupViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet weak var groupInfoTable: UITableView!
    
    //Define rows etc.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    // Create cell
    public func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "groupCell")
        //let group = self.groupItems[indexPath.row]
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
    

    
}
