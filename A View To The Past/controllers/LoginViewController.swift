//
//  LoginViewController.swift
//  A View To The Past
//
//  Created by James O'Rourke on 01/03/2020.
//  Copyright © 2020 James O'Rourke. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
   
    
    @IBOutlet var username: UITextField!

    @IBOutlet var password: UITextField!
    
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginPressed() {
        
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (authResult, error) in
            
            if error != nil {
                print("oooops there was an error!!, ", error)
               self.errorLabel.text = "error with login credientals"
            }else{
                print("hello", authResult!.user.uid)
                self.username.text = ""
                self.password.text = ""
                self.navigateToMain()
            }

}
        
    }
    
    
    private func navigateToMain(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainNavcontroller = mainStoryBoard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else {
            return
        }
        present(mainNavcontroller, animated: true, completion: nil)
    }
    
    
    
}
