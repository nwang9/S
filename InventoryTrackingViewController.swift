//
//  InventoryTrackingViewController.swift
//  Smarthin
//
//  Created by Nico on 6/22/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class InventoryTrackingViewController: UIViewController {

    @IBAction func scanInventory(_ sender: Any) {
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inventoryScan") as UIViewController
            self.present(viewController, animated: false, completion: nil)
    }
    
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
