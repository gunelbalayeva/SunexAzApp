//
//  CollectionView+ext.swift
//  SunexAzApp
//
//  Created by User on 13.04.25.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    static var identifier:String {
        String(describing: self)
    }
    
    static var nib :UINib {
        return UINib(nibName: self.identifier, bundle: .main)
    }
}
