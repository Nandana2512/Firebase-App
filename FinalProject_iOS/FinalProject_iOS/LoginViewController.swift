//
//  LoginViewController.swift
//  FinalProject_iOS
//

//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if email.text != "" && password.text != ""{
            Auth.auth().signIn(withEmail: email.text!, password: password.text!){
                ( authData, error) in
                if error != nil {
                    self.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!")
                }else{
                    self.performSegue(withIdentifier: "toHomeVC", sender: nil) 
                }
            }
        }else{
            makeAlert(title: "Error", message: "Email/Password Missing!") 
        }
        
        performSegue(withIdentifier: "toHomeVC", sender: nil)
    }
    
    func makeAlert(title: String, message: String  ){
        let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present( alert, animated: true, completion: nil)
    }
}