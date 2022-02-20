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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(_ menuModel: MenuModel) {
        menuIcon.image = menuModel.imgIcon
        menuItemName.text = menuModel.itemLable
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
