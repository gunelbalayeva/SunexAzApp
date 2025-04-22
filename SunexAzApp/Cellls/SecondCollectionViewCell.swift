//
//  SecondCollectionViewCell.swift
//  SunexAzApp
//
//  Created by User on 13.04.25.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    struct Item {
        var image:String
    }

    func configure(with item:Item){
        imageView.image = UIImage(named: item.image)
    }
}
