//
//  HomepageViewController.swift
//  Smarthin
//
//  Created by Nico on 6/14/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class HomepageViewController: BaseViewController {
    

    @IBOutlet weak var dataCharts: UIButton!
    
    // Sends user to contact us page
    @IBAction func contactUsPage(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "contactUs") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    // Sends user to account management page
    @IBAction func accountManagementPage(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "accountManagement") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    // Sends user to inventory setup page
    @IBAction func inventorySetupPage(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inventorySetup") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    // Sends user to inventory trace page
    @IBAction func inventoryTrackingPage(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inventoryTrack") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    //Sends user to data page

    @IBAction func dataPage(_ sender: Any) {
            let viewController:UIViewController = UIStoryboard(name: "Second", bundle: nil).instantiateViewController(withIdentifier: "dataChart") as UIViewController
            self.present(viewController, animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
