//
//  HomeCell.swift
//  BasicIOS-tutorial-TableView
//
//  Created by Apple on 31/07/2021.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func folowButton(_ sender: Any) {
        
    }
}
