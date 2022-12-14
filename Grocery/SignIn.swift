//
//  SignIn.swift
//  Grocery
//
//  Created by Alexander Masztak on 12/13/22.
//

import UIKit
import Firebase
import CoreData

class SignIn: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    
    let Context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var login: [Login] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        getData()
        
        emailTextField.text = login[0].email
        passwordTextFIeld.text = login[0].password
        
    }

    func getData()  {
        if let myLogin = try? Context.fetch(Login.fetchRequest()){
            login = myLogin
        } else {
            print("error")
            
        }
    }

    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        var email = emailTextField.text!
        var password = passwordTextFIeld.text!
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    if self.rememberMeSwitch.isOn {
                        let appdelegate = UIApplication.shared.delegate as! AppDelegate
                        let context = appdelegate.persistentContainer.viewContext
                        let login = Login(context: context)
                        login.setValue(email, forKey: "email")
                        login.setValue(password, forKey: "password")
                        appdelegate.saveContext()
                    }
                    self.performSegue(withIdentifier: "toMainPage", sender: nil)
                
                        print("sign in successful!")
                } else {
                    print(error!.localizedDescription)
            }
        })
    }
}
