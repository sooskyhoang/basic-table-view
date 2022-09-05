//
//  TableCell.swift
//  project5-basictableview
//
//  Created by nguyen van hoang on 27/07/2022.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
