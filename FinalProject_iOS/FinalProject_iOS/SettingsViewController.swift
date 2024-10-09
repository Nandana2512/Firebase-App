//
//  SettingsViewController.swift
//  FinalProject_iOS
//

//

import UIKit
import FirebaseCore
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
        }catch {
            print("error")
            self.performSegue(withIdentifier: "toLoginVC", sender: nil)
        }
        performSegue(withIdentifier: "toLoginVC", sender: nil)
    }
    
}
