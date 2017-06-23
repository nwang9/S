//
//  InventoryTrackingViewController.swift
//  Smarthin
//
//  Created by Nico on 6/22/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class InventoryTrackingViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    
   // Store Inventory Data in cellContent
    // let cellContent = [a:b]
    
    //Define rows etc.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    // Create cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "trackingCell")
        
        return cell
    }
    

    // Send to scan page
    @IBAction func scanInventory(sender: UIButton) {
      //  let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tableView)
        //let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        let invScanViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inventoryScan") as! ScanInventoryViewController
        
        
            self.present(invScanViewController, animated: false, completion: nil)
    }
    // Send to trace page
    @IBAction func traceInventory(_ sender: Any) {
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inventoryTrace") as UIViewController
            self.present(viewController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
