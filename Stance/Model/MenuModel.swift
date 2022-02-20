//
//  MenuModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class MenuModel {
    
    
    var imgIcon: UIImage?
    var itemLable: String?
    
    internal init(imgIcon: UIImage? = nil, itemLable: String? = nil) {
        self.imgIcon = imgIcon
        self.itemLable = itemLable
    }
}
