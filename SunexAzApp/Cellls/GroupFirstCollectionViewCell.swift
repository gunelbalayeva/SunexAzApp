//
//  GroupFirstCollectionViewCell.swift
//  SunexAzApp
//
//  Created by User on 13.04.25.
//

import UIKit

class GroupFirstCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    struct Item{
        var image:String
        var title:String
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item:Item){
        imageview.image = UIImage(named: item.image)
        titleLabel.text = item.title
    }
    
}
