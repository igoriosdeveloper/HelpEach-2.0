//
//  CompletedTableViewCell.swift
//  helpeach
//
//  Created by Igor Astsatryan on 18.05.23.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var spec: UILabel!
    @IBOutlet weak var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
