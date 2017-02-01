//
//  ViewController.swift
//  Firebase Email Login Example Project
//
//  Created by Zulwiyoza Putra on 2/1/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBAction func signInButton(_ sender: Any) {
        
        if let email = emailLabel.text, let password = passwordLabel.text{
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    print("There was an error occured \(error.debugDescription)")
                    self.signIn()
                    
                } else {
                    print("\(user.debugDescription) user created")
                    self.signIn()
                }
                
            })
        }
        
        
    }
    
    private func signIn() -> Void {
        if let email = emailLabel.text, let password = passwordLabel.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error != nil {
                    print("There was an error occured \(error.debugDescription)")
                } else {
                    print("Logged in")
                }
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

