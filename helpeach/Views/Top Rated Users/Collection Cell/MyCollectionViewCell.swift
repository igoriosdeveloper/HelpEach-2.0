//
//  MyCollectionViewCell.swift
//  helpeach
//
//  Created by Igor Astsatryan on 18.05.23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell",
                     bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Model) {
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
    }

}
