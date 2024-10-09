//
//  HomeViewController.swift
//  FinalProject_iOS
//

//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var userTitleArray = [String]()
    var userDescArray = [String]()
    var userDateArray = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 300
        return userTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.titleText.text = userTitleArray[indexPath.row]
        cell.descText.text = userDescArray[indexPath.row]
        cell.dateText.text = userDateArray[indexPath.row]
        return cell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        getFireStoreFunction()
    }
    
    func getFireStoreFunction()
    {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("todos").addSnapshotListener( {
            ( snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Something went Wrong.")
            }else{
                if  snapshot?.isEmpty != true && snapshot != nil {
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        print(documentID)
                        
                        if let title =  document.get("title") as? String{
                            self.userTitleArray.append(title)
                        }
                        
                        if let desc = document.get("desc") as? String {
                            self.userDescArray.append(desc)
                        }
                        
                        if let timestamp = document.get("date") as? Timestamp {
                            let date = timestamp.dateValue()
                            let dateFormatter = DateFormatter()                            
                            dateFormatter.timeStyle = .medium
							dateFormatter.dateStyle = .medium
                            let stringDate = dateFormatter.string(from: date)
                            self.userDateArray.append(stringDate)
                            
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    
}
