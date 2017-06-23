//
//  BaseViewController.swift
//  Smarthin
//
//  Created by Nico on 6/15/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class BaseViewController: UIViewController {
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Home Button
        
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 165, y: 52, width: 45, height: 45)
        homeButton.backgroundColor = UIColor.darkGray
        homeButton.setImage(UIImage(named: "Home.png"), for: UIControlState.normal)
        homeButton.setTitle("Home Button", for: .normal)
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        self.view.addSubview(homeButton)
        
        //Sign Out Button
        
        let signOutButton = UIButton()
        signOutButton.frame = CGRect(x: 230, y: 72, width: 105, height: 30)
        signOutButton.backgroundColor = UIColor.black
        signOutButton.layer.cornerRadius = 5
        signOutButton.layer.borderWidth = 1
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        self.view.addSubview(signOutButton)
    }
    
    func goHome(sender: UIButton!) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    func signOut() {
        PFUser.logOut()
        let currentUser = PFUser.current()
        if currentUser == nil {
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "logIn") as UIViewController
            self.present(viewController, animated: false, completion: nil)
        }
    
    }
}

