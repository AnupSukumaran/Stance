//
//  MenuItemTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var menuItemName: UILabel!
    
    func config(_ menuModel: MenuModel) {
        menuIcon.image = menuModel.imgIcon
        menuItemName.text = menuModel.itemLable
    }

}
