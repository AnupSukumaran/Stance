//
//  HomeSectionTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit

class HomeSectionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var addedReps: UILabel!
    @IBOutlet weak var reps: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(cellModel: CellModel!) {
        partLabel.text = cellModel.exeLabel
        addedReps.text = cellModel.addedReps
        reps.text = cellModel.reps
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
