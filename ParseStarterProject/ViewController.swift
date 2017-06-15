/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    //Activity Indicator
    var activityIndicator = UIActivityIndicatorView()
    
    
    // Login Page Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var signupOrLogin: UIButton!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var changeSignupModeButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //Alert function
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: {(action) in self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    var signupMode = true
    //Sign Up or Log In
    @IBAction func signupOrLogin(_ sender: Any) {
        // Empty Form Error
        if emailTextField.text == "" || passwordTextField.text == "" {
            createAlert(title: "Form Error", message: "Please enter an email and password")
        } else {
            
            //Activity Indicator while Signing Up or Logging In
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            
            if signupMode {
        // Sign Up
                let user = PFUser()
                user.username = emailTextField.text
                user.password = passwordTextField.text
                if companyName.text != "" {
                    user["companyName"] = companyName.text
                }
                user.signUpInBackground(block: { (success, error) in
                    // End indicator when done signing up
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if error != nil {
                        var displayErrorMessage = "Please try again later"
                        if let errorMessage = error as? NSError {
                            displayErrorMessage = String(errorMessage.localizedDescription)
                        }
                        self.createAlert(title: "Form Error", message: displayErrorMessage)
                    } else {
                        self.createAlert(title: "Success", message: "Sign Up Successful!")
                    }
                    
                })
            } else {
         // Log In
                
                PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!, block: { (user, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if error != nil {
                        var displayErrorMessage = "Please try again later"
                        if let errorMessage = error as? NSError {
                            displayErrorMessage = String(errorMessage.localizedDescription)
                        }
                        self.createAlert(title: "Form Error", message: displayErrorMessage)
                    } else {
                        // Go to Homepage if credentials are valid
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage") as UIViewController
                        self.present(viewController, animated: false, completion: nil)
                        
                        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        
                        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("nextView") as NextViewController
                        self.presentViewController(nextViewController, animated:true, completion:nil)*/
                    }
                })
            }
        }
    }
    
    @IBAction func changeSignupMode(_ sender: Any) {
        if signupMode {
            // change to login mode
            signupOrLogin.setTitle("Log In", for: [])
            changeSignupModeButton.setTitle("Sign Up", for: [])
            messageLabel.text = "Don't have an account?"
            signupMode = false
            companyName.isHidden = true
        } else {
            //change to signup mode
            signupOrLogin.setTitle("Sign Up", for: [])
            changeSignupModeButton.setTitle("Log In", for: [])
            messageLabel.text = "Already have an account?"
            signupMode = true
            companyName.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
