//
//  HomeTableViewCell.swift
//  FinalProject_iOS
//
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    

    @IBOutlet weak var desc: UILabel!
    
    
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
