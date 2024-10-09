//
//  UploadViewController.swift
//  FinalProject_iOS
//

//

import UIKit
import FirebaseCore
import FirebaseFirestore

class UploadViewController: UIViewController {
    
    
    @IBOutlet weak var title: UITextField!
    
    @IBOutlet weak var desc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func uploadButton(_ sender: UIButton) {
        let firestoreDatabase = Firestore.firestore()
        var firestoreReference: DocumentReference? = nil
        
        if title.text != "" && desc.text != "" {
            
            let todo = [
                "title": title.text!,
                "desc": desc.text!,
                "date": FieldValue.serverTimestamp()
            ] as [String: Any]
            
            firestoreReference = firestoreDatabase.collection("todos").addDocument(data: todo, completion: {
                (error) in
                print("Firestore Reference! ")
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Unable to upload Todo.")
                }else{
                    self.title.text = ""
                    self.desc.text = ""
                    print("Todo Uploaded Successfully!")
                    self.tabBarController?.selectedIndex = 0
                }
            })
            
            
        }else{
            makeAlert(title: "Missing", message: "Title/Description is missing!")
        }
        
    }
    
    func makeAlert(title: String, message: String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
         self.present( alert, animated: true, completion: nil)
    }
}

