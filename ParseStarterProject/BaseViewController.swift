//
//  BaseViewController.swift
//  Smarthin
//
//  Created by Nico on 6/15/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeButton = UIButton(frame: CGRect(x: 165, y: 52, width: 45, height: 45))
        homeButton.backgroundColor = .black
        homeButton.setImage(UIImage(named: "Home.png"), for: UIControlState.normal)
        homeButton.setTitle("Home Button", for: .normal)
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        self.view.addSubview(homeButton)

    }
    
    func goHome(sender: UIButton!) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
}

