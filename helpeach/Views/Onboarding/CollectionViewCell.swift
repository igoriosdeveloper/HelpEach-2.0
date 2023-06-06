//
//  CollectionViewCell.swift
//  helpeach
//
//  Created by Igor Astsatryan on 19.03.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideMoreInfo: UILabel!
    @IBOutlet weak var slideImg: UIImageView!
    
    func setup(_ slide: OnboardingSlide) {
        slideTitle.text = slide.title
        slideMoreInfo.text = slide.description
        slideImg.image = slide.img
    }
    
}
