//
//  SignUp.swift
//  Grocery
//
//  Created by Alexander Masztak on 12/13/22.
//

import UIKit
import Firebase

class SignUp: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func createPressed(_ sender: UIButton) {
        
        var email = emailTextField.text!
        var password = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
        
    }
    
}
